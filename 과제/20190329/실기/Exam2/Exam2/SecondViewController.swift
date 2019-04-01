//
//  SecondViewController.swift
//  Exam2
//
//  Created by JinBae Jeong on 29/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var password = ""
    
    let secondVCLabel = UILabel()
    let secondVCDismissButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        print(password)
        
        secondVCLabel.frame = CGRect(x: view.frame.width / 2 - 150, y: 100, width: 300, height: 50)
        secondVCLabel.text = password
        secondVCLabel.textAlignment = .center
        secondVCDismissButton.frame = CGRect(x: view.frame.width / 2 - 150, y: 200, width: 300, height: 50)
        secondVCDismissButton.center = view.center
        secondVCDismissButton.setTitle("dismiss", for: .normal)
        
        view.addSubview(secondVCLabel)
        view.addSubview(secondVCDismissButton)
        
        secondVCDismissButton.addTarget(self, action: #selector(dismissFirstVC), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissFirstVC(_ sender: Any) {
        // 동작 차이
        // A -> B -> C
        // 내가 C일 때, B  한테 나를 내려달라고 요청 -> 나는 사라짐
        // presentingViewController?.dismiss(animated: true)
        
        
        let firstVC = ViewController()
        // 동작 차이
        // A -> B -> C
        // 내가 C, 내가 띄우고 있는 presenting(X) presentedVC 체크해서 있으면 dismiss
        // 없으면 내가 dismiss
        // 내가 B일 때, 내가 dismiss 안 되고, C를 dismiss
        dismiss(animated: true)
        firstVC.passwordTextField.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
