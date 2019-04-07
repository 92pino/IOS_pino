//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by JinBae Jeong on 06/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

// UITextFieldDelegate라는 델리게이트 프로토콜 선언
class ViewController: UIViewController, UITextFieldDelegate {

    // 택스트필드를 활성화 시켰을 때 키보드창이 올라오면서 텍스트필드도 같이 위로 올라가게 변수 지정
    var slidingUpTextfield = false
    
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tf.placeholder = "값을 입력하세요"
        tf.keyboardType = UIKeyboardType.alphabet
        tf.keyboardAppearance = UIKeyboardAppearance.dark
        tf.returnKeyType = UIReturnKeyType.join
        tf.enablesReturnKeyAutomatically = true
        
        /*
            스타일 설정
        */
        
        tf.borderStyle = UITextField.BorderStyle.line
        tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        tf.contentVerticalAlignment = .center
        tf.contentHorizontalAlignment = .center
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.borderWidth = 2.0
        
        tf.becomeFirstResponder()
        
        // 델리게이트 지정
        self.tf.delegate = self
        
    }

    @IBAction func confirm(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체에서 해제
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체로 지정
        self.tf.becomeFirstResponder()
    }
    
    // 텍스트필드의 편집을 시작할 때 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작됩니다.")
        
        guard slidingUpTextfield == false else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.tf.frame.origin.y -= 250
            self.slidingUpTextfield = true
        }
        
//        UIView.animate(withDuration: 0.3) {
//            self.tf.frame.origin.y -= 250
//            self.slidingUpTextfield = true
//        }
    }
    
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다")
        return true
    }
    
    // 텍스트 필드의 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴
            if (textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        } else {    // 입력된 값이 숫자라면 false를 리턴
            return false
        }
        
    }
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        UIView.animate(withDuration: 0.3) {
            self.tf.frame.origin.y += 250
            self.slidingUpTextfield = false
        }
        return true
    }
    
    // 텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        
        return true
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
}

