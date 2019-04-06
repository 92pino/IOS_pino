//
//  ViewController.swift
//  LoginExample
//
//  Created by JinBae Jeong on 05/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class Padding {
    static let padding = Padding()
    let padding: CGFloat = 15
}

class ViewController: UIViewController {
    
    let someView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var center = view.frame.width / 2
        
        /* logo */
        let logoArea = UIImageView()
        logoArea.frame = CGRect(x: (view.frame.width / 2) - (250 / 2), y: 50, width: 250, height: 55)
        let logo = UIImage(named: "fastcampus_logo")
        logoArea.image = logo
        view.addSubview(logoArea)
        
        var dot01 = UILabel()
        var dot02 = UILabel()
        var dot03 = UILabel()
        dot01.backgroundColor = .red
        dot02.backgroundColor = .red
        dot03.backgroundColor = .red
        dot01.frame = CGRect(x: center - 50, y: 130, width: 20, height: 20)
        dot02.frame = CGRect(x: center - 10, y: 130, width: 20, height: 20)
        dot03.frame = CGRect(x: center + 30, y: 130, width: 20, height: 20)
        dot01.layer.cornerRadius = 5
        dot02.layer.cornerRadius = 5
        dot03.layer.cornerRadius = 5
        
        view.addSubview(dot01)
        view.addSubview(dot02)
        view.addSubview(dot03)
        
        /* // logo */
        
        /* button */
        signInButton()
        /* button*/
    }
    
    func textFieldArea() {
        let fieldView: UIView
        let fieldIcoArea: UIView
        let fieldIco: UIImageView
        let textFieldArea: UIView
        let textField: UITextField
        let height = 50
        
        
    }
    
    func signInButton(){
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.frame = CGRect(x: Padding().padding, y: 500, width: view.frame.width - 30, height: 50)
        button.layer.cornerRadius = 10
        view.addSubview(button)
    }
    
}

