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
        secondVCDismissButton.setTitle("dismiss", for: .normal)
        
        view.addSubview(secondVCLabel)
        view.addSubview(secondVCDismissButton)
        
        secondVCDismissButton.addTarget(self, action: #selector(dismissFirstVC), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissFirstVC(_ sender: Any) {
        let firstVC = ViewController()
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
