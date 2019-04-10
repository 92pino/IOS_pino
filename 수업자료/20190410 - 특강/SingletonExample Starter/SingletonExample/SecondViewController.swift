//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by JinBae Jeong on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userDefault()
    }
    
    func userDefault() {
        var name1: String = UserData.singleton.userName ?? ""
        var pw1: String = UserData.singleton.password ?? ""
        var age1: String = UserData.singleton.age ?? ""
        var phone1: String = UserData.singleton.phone ?? ""
        
        
        
        name.text = "\(name1)"
        password.text = "비밀번호 : \(pw1)"
        age.text = "나이 : \(age1)"
        phone.text = "핸드폰번호 : \(phone1)"
    }
    
}
