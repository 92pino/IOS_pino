//
//  AViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol TodoList {
    func textPresnt(_ text: String?)
}

class AViewController: UIViewController, UITextFieldDelegate {
    

    var delegate: TodoList?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let staffVC = segue.destination as? BViewController else {return}
        self.delegate = staffVC
        staffVC.delegate2 = self
        delegate?.textPresnt(textField.text)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension AViewController: sendTxt {

    func textPresent(_ text: String?) {
        print(text)
        resultLabel.text = text
    }
    
    
}
