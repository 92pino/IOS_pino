//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSubmit(_ sender: Any) {
        
        // UserDefault 객체의 인스턴스를 가져옴
        let ud = UserDefaults.standard
        
        // 값을 저장
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
}
