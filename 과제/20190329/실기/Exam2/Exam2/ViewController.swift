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
        // switch의 경우 기본 사이즈가 정해져있으므로 CGPoint만 작성해도 상관없다
        passwordSwitch.center = CGPoint(x: view.center.x, y: 200)
        passwordSwitch.isEnabled = false
        
        passwordTextField.addTarget(self, action: #selector(checkPassword(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(goToSecondVC(_:)), for: .editingDidEndOnExit)
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordSwitch)
    }
    
    @objc func checkPassword(_ sender: Any) {
        var passwordChk = true
        
        if passwordTextField.text == myPassword {
            passwordSwitch.setOn(true, animated: true)
        } else {
            passwordSwitch.setOn(false, animated: true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTextField.becomeFirstResponder()
    }


}

