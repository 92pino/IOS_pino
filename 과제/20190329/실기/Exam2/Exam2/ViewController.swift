//
//  ViewController.swift
//  Exam2
//
//  Created by JinBae Jeong on 29/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passwordTextField: UITextField = UITextField()
    var passwordSwitch: UISwitch = UISwitch()
    var myPassword = "qwer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /* 각 위치 */
        passwordTextField.frame = CGRect(x: view.frame.width / 2 - 150, y: 100, width: 300, height: 50)
        passwordTextField.borderStyle = .line
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.isSecureTextEntry = true
        passwordSwitch.frame = CGRect(x: view.frame.width / 2 - 50, y: 200, width: 100, height: 50)
        passwordSwitch.isEnabled = false
        
        passwordTextField.addTarget(self, action: #selector(checkPassword(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(goToSecondVC(_:)), for: .editingDidEndOnExit)
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordSwitch)
    }
    
    @objc func checkPassword(_ sender: Any) {
        var passwordChk = true
        
        if passwordTextField.text == myPassword {
            passwordSwitch.isOn = true
        } else {
            passwordSwitch.isOn = false
        }
    }
    
    @objc func goToSecondVC(_ sender: Any) {

        
        let secondVC = SecondViewController()
        secondVC.password = myPassword
        
        if passwordTextField.text == myPassword {
            present(secondVC, animated: true)
        } else {
            return
        }
        
    }


}

