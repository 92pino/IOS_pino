//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    // 연산 기호를 저장
    var operatorSign: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
    }
    
    // 초기값 세팅
    // displayLabel에 출력될 값 저장
    var displayText: String? = nil
    var oper: String? = nil
    
    // 기존값
    var firstOper: Double = 0
    // 새로 입력될 연산값
    var secondOper: Double = 0
    
    
    
    @IBAction func btnNumberClick(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
        if displayText == nil {
            displayText = sender.titleLabel!.text!
        } else {
            displayText? += sender.titleLabel!.text!
        }
        displayLabel.text = displayText
    }
    
    @IBAction func oper(_ sender: UIButton) {
        if displayText != nil {
            operatorEvent()
            operatorSign = sender.titleLabel!.text!
            displayText = nil
            if sender.titleLabel!.text! == "=" {
                displayLabel.text = String(firstOper)
            }
        }else {
            operatorSign = sender.titleLabel!.text!
        }
    }
    
    @IBAction func btnClear(_ sender: Any) {
        displayLabel.text = "0"
        oper = nil
        firstOper = 0
        secondOper = 0
        operatorSign = nil
        print(displayLabel, oper, firstOper, secondOper, operatorSign)
    }
    
    func operatorEvent() {
        if operatorSign == nil {
            firstOper = Double(displayText!)!
        } else {
            secondOper = Double(displayText!)!
            switch operatorSign {
            case "+" :
                firstOper += secondOper
            case "-" :
                firstOper -= secondOper
            case "×" :
                firstOper *= secondOper
            case "÷" :
                firstOper /= secondOper
            default :
                print("다른거")
            }
        }
    }
    
}
