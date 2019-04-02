//
//  SecondViewController.swift
//  StroyboardSegue
//
//  Created by JinBae Jeong on 02/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var count = 0
    var minus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "\(count)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToThirdViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func EditingChanged(_ sender: UITextField) {
        guard let number = Int(sender.text ?? "0") else { return }
        
        minus = number
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
