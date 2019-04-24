//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*defaultLabel.backgroundColor = .green
        autoLayout()
        defaultLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(defaultLabel)*/
    }

    func autoLayout(){
        defaultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        defaultLabel.topAnchor.constraint(equalTo: view.topAnchor)
        defaultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60)
        defaultLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }

}

