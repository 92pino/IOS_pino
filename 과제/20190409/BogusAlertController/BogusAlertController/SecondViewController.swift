//
//  SecondViewController.swift
//  BogusAlertController
//
//  Created by JinBae Jeong on 09/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

protocol changeBackgroundColor: class {
    func sendColor(_ color: UIColor)
}

class SecondViewController: UIViewController {

    weak var delegate: changeBackgroundColor?
    
    @IBOutlet weak var btn01: UIButton!
    @IBOutlet weak var btn02: UIButton!
    @IBOutlet weak var goToFirst: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goToFirst.addTarget(self, action: #selector(goToDismiss(_:))
            , for: .touchUpInside)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print(1111)
            delegate?.sendColor(#colorLiteral(red: 0.8549019694, green: 0.4655903449, blue: 0.6623601463, alpha: 1))
        default:
            print(2222)
            delegate?.sendColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
    }
    
    @objc func goToDismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
