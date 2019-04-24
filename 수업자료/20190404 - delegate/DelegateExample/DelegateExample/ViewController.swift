//
//  ViewController.swift
//  DelegateExample
//
//  Created by JinBae Jeong on 23/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        textField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        customView.backgroundColor = .green
    }

}

extension ViewController: CustomViewDelegate {
    
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return.gray }
        return color == .green ? .blue : color
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // 텍스트필드에 입력할때 이벤트
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch text {
            case "red": customView.backgroundColor = .red
            case "blue": customView.backgroundColor = .blue
            case "black": customView.backgroundColor = .black
            default: customView.backgroundColor = .gray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드 내릴 때 사용 resignFirstResponder
        
        
        textField.resignFirstResponder()
        return true
    }
}
