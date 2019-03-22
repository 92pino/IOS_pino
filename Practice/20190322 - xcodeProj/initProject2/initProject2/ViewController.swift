//
//  ViewController.swift
//  initProject2
//
//  Created by JinBae Jeong on 22/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var changeLabel: UILabel!
    @IBOutlet var increaseBtn: UIButton!
    @IBOutlet var decreaseBtn: UIButton!
    @IBOutlet var powerOnOff: UISwitch!
    
    var result = 0 {
        willSet {
            changeLabel.text = String(newValue)
        }
    }
    
//    func incrementCount() -> String {
//        result += 1
//        return "\(result)"
//    }
    
//    func decrementCount() -> String {
//        result -= 1
//        return "\(result)"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        increaseBtn.addTarget(self, action: #selector(upBtn(_:)), for: .touchUpInside)
        decreaseBtn.addTarget(self, action: #selector(downBtn(_:)), for: .touchUpInside)
        
        powerOnOff.addTarget(self, action: #selector(powerOnOff(_:)), for: .valueChanged)
        
        increaseBtn.backgroundColor = .blue
        decreaseBtn.backgroundColor = .red
    }
    
    @objc func upBtn(_ sender: Any) {
        if powerOnOff.isOn == true {
            result += 1
            changeLabel.textColor = .blue
    //        changeLabel.text = incrementCount()
        }
    }
    
    @objc func downBtn(_ sender: Any) {
        if powerOnOff.isOn == true {
            result -= 1
            changeLabel.textColor = .red
    //        changeLabel.text = decrementCount()
        }
    }
    @objc func powerOnOff(_ sender: UISwitch) {
        if powerOnOff.isOn == true {
            
            changeLabel.text = "ON"
            changeLabel.isEnabled == true
        } else {
            result = 0
            changeLabel.text = "OFF"
            changeLabel.isEnabled == false
        }
    }



}
