//
//  ViewController.swift
//  LoginExample
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var slidingUpTextfield = false
    
    @IBOutlet weak var loginTextField: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.email.delegate = self
        self.password.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        let usersData = ud.object(forKey: "users") as? [String: String]
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        let ud = UserDefaults.standard
        
        
        let id = self.email.text ?? ""
        let pw = self.password.text ?? ""
        
        ud.set(password.text, forKey: email.text ?? "")
        ud.object(forKey: email.text ?? "")
        
        ud.set(self.email.text, forKey: "email")
        print("값저장")
    }
    // 값을 저장
    @IBAction func goToSignIn(_ sender: UIButton) {
        let ud = UserDefaults.standard
        
        guard let text = ud.object(forKey: email.text ?? "") as? String else {
            print("아이디 없음")
            return
        }
        
        if (text == password.text) {
            let rvc = ResultViewController()
            rvc.WelcomeId.text = String(email.text ?? "") + "님 환영합니다."
            rvc.WelcomePw.text = "비밀번호는 \(text)입니다."
            present(rvc, animated: true)
        } else {
            print("비밀번호 틀림")
        }
        print(text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작됩니다.")
        
        guard slidingUpTextfield == false else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.loginTextField.frame.origin.y -= 150
            self.slidingUpTextfield = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3) {
            self.loginTextField.frame.origin.y += 150
            self.slidingUpTextfield = false
        }
        return true
    }
    
}

