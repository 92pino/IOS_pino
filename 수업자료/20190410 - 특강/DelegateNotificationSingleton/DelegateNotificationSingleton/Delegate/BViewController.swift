//
//  BViewController.swift
//  DelegateNotificationSingleton
//
//  Created by Wi on 09/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol sendTxt: class {
    func textPresent(_ text: String?)
}

class BViewController: UIViewController, UITextFieldDelegate, TodoList {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    var data: String?
    weak var delegate2: sendTxt?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = data
        textField.delegate = self
    }
    
    func textPresnt(_ text: String?) {
        data = text
    }
    @IBAction func toBossViewBtnDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate2?.textPresent(textField.text)
    }
    
    
}
