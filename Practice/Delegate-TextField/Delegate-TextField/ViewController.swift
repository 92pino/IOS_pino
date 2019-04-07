//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by JinBae Jeong on 06/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }


}

