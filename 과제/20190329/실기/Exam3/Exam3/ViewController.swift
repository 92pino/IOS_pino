//
//  ViewController.swift
//  Exam3
//
//  Created by JinBae Jeong on 29/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count01 = 0
    var count02 = 0
    var count03 = 0
    var money = 40000
    
    @IBOutlet var menuBtn01: UIButton!
    @IBOutlet var menuBtn02: UIButton!
    @IBOutlet var menuBtn03: UIButton!
    @IBOutlet var menuPrice01: UILabel!
    @IBOutlet var menuPrice02: UILabel!
    @IBOutlet var menuPrice03: UILabel!
    @IBOutlet var menuCount01: UILabel!
    @IBOutlet var menuCount02: UILabel!
    @IBOutlet var menuCount03: UILabel!
    @IBOutlet var menuName01: UILabel!
    @IBOutlet var menuName02: UILabel!
    @IBOutlet var menuName03: UILabel!
    
    let resultTit01 = UILabel()
    let resultTit02 = UILabel()
    var haveMoney = UILabel()
    var totalPrice = UILabel()
    let resetButton = UIButton(type: .system)
    let payment = UIButton(type: .system)
    
    let menu: [Menu] = [
        Menu(name: "짜장면", price: 5000),
        Menu(name: "짬뽕", price: 6000),
        Menu(name: "탕수육", price: 12000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuName01.text = menu[0].name
        menuName02.text = menu[1].name
        menuName03.text = menu[2].name
        
        menuPrice01.text = "\(menu[0].price)원"
        menuPrice02.text = "\(menu[1].price)원"
        menuPrice03.text = "\(menu[2].price)원"
        
        resultTit01.frame = CGRect(x: 20, y: 350, width: 80, height: 40)
        resultTit01.text = "소지금"
        resultTit01.textAlignment = .center
        resultTit01.backgroundColor = .green
        resultTit02.frame = CGRect(x: 20, y: 400, width: 80, height: 40)
        resultTit02.text = "결제금액"
        resultTit02.textAlignment = .center
        resultTit02.backgroundColor = .orange
        resetButton.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        resetButton.backgroundColor = .yellow
        resetButton.setTitle("초기화", for: .normal)
        payment.frame = CGRect(x: 270, y: 400, width: 80, height: 40)
        payment.backgroundColor = .black
        payment.backgroundColor = .yellow
        payment.setTitle("결제", for: .normal)
        
        haveMoney.frame = CGRect(x: 110, y: 350, width: 140, height: 40)
        haveMoney.text = "\(money)원"
        haveMoney.textAlignment = .right
        haveMoney.backgroundColor = .green
        totalPrice.frame = CGRect(x: 110, y: 400, width: 140, height: 40)
        totalPrice.text = "0원"
        totalPrice.textAlignment = .right
        totalPrice.backgroundColor = .green
        
        resetButton.addTarget(self, action: #selector(resetBtn), for: .touchUpInside)
        payment.addTarget(self, action: #selector(paymentFunc), for: .touchUpInside)
        
        view.addSubview(resultTit01)
        view.addSubview(resultTit02)
        view.addSubview(haveMoney)
        view.addSubview(totalPrice)
        view.addSubview(resetButton)
        view.addSubview(payment)
        print(111);
        
    }
    
    
    
    @IBAction func menuAdd01(_ sender: Any) {
        count01 += 1
        menuCount01.text = String("\(count01)")
        var test = (menu[0].price * Int(count01) + (menu[1].price * Int(count02)) + (menu[2].price * Int(count03)))
        totalPrice.text = "\(test)원"
    }
    @IBAction func menuAdd02(_ sender: Any) {
        count02 += 1
        menuCount02.text = String("\(count02)")
        var test = (menu[0].price * Int(count01) + (menu[1].price * Int(count02)) + (menu[2].price * Int(count03)))
        totalPrice.text = "\(test)원"
    }
    @IBAction func menuAdd03(_ sender: Any) {
        count03 += 1
        menuCount03.text = String("\(count03)")
        var test = (menu[0].price * Int(count01) + (menu[1].price * Int(count02)) + (menu[2].price * Int(count03)))
        totalPrice.text = "\(test)원"
    }
    
    @objc func resetBtn() {
        count01 = 0
        count02 = 0
        count03 = 0
        menuCount01.text = "0"
        menuCount02.text = "0"
        menuCount03.text = "0"
        var test = (menu[0].price * Int(count01) + (menu[1].price * Int(count02)) + (menu[2].price * Int(count03)))
        print(test)
        totalPrice.text = "\(test)원"
    }
    
    @objc func paymentFunc(){
        var test = (menu[0].price * Int(count01) + (menu[1].price * Int(count02)) + (menu[2].price * Int(count03)))
        
        let alertController = UIAlertController(title: "결제하기" , message: "총 결제 금액은 \(test)입니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let downAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.haveMoney.text = "\(self.money - test)원"
        }
        
        if self.money - test < 0 {
            
        } else {
            
        }
    }
}

