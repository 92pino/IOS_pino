//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "eamil") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
    }
    
}

