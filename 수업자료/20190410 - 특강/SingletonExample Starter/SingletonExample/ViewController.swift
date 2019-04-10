//
//  ViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.delegate = self
        password.delegate = self
        age.delegate = self
        phone.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let userName = name.text else {return true}
        guard let userpassword = password.text else {return true}
        guard let age = age.text else {return true}
        guard let phone = phone.text else {return true}
        
        UserData.singleton.userName = userName
        print("name: ", userName, UserData.singleton.userName)
        UserData.singleton.password = userpassword
        UserData.singleton.age = age
        UserData.singleton.phone = phone
        
        return true
    }
    
    @objc func goToSignUp (){
        let secondVC = SecondViewController()
        secondVC.present(secondVC, animated: true)
    }


}

