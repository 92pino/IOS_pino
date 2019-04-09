//
//  ViewController.swift
//  BogusAlertController
//
//  Created by JinBae Jeong on 09/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("Alert", for: .normal)
        alertButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.layer.cornerRadius = 20
        alertButton.frame = CGRect(x: view.frame.width / 2 - (view.frame.width - 100) / 2, y: view.frame.height / 2 - 25, width: view.frame.width - 100, height: 50)
        
        alertButton.addTarget(self, action: #selector(presentNextPage(_sender:)), for: .touchUpInside)
        view.addSubview(alertButton)
        
    }

    @objc func presentNextPage(_sender : Any) {
        print(1111)
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC, animated: true)
    }
    
}

