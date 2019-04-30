//
//  ViewController.swift
//  Notification_Homework2
//
//  Created by JinBae Jeong on 30/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

extension ViewController {
    static var textFieldNotification: Notification.Name {
        return Notification.Name("sendTextField")
    }
}

class ViewController: UIViewController {

    let tf = UITextField()
    let notiCenter = NotificationCenter.default
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "첫번째화면"
        
        autoLayout()
        tf.delegate = self
        
        secondVC.set()
    }
    
    @objc func sendData(){
        
    }
    
    func autoLayout(){
        view.addSubview(tf)
        tf.placeholder = "텍스트를 입력해주세요."
        tf.layer.borderWidth = 1
        tf.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        tf.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tf.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    deinit {
        notiCenter.removeObserver(self)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var txt = tf.text!
        notiCenter.post(name: Notification.Name("sendTextField"), object: nil, userInfo: ["txt" : tf.text!])
        navigationController?.pushViewController(secondVC, animated: true)
        return true
    }
}
