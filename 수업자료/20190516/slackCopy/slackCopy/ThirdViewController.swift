//
//  ThirdViewController.swift
//  slackCopy
//
//  Created by JinBae Jeong on 16/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var saveText: String!
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
//        button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let floatLabel: UILabel = {
        let label = UILabel()
        label.text = ".slack.com"
        label.textColor = .red
        
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeImage = UIImage(named: "btnBack")!
        button.setImage(closeImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let wsNameTextField: UITextField = {
        let textField = UITextField()
        // 커스텀 plalceholder
        
        
        return textField
    }()
    
    private var indicatorViewLeadingConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
        autoLayout()
    }
    
    func configure() {
        view.backgroundColor = .white
        wsNameTextField.delegate = self
        view.addSubviews([nextButton, closeButton, wsNameTextField, floatLabel])
        wsNameTextField.text = saveText!
        
        
    }
    
    func autoLayout() {
        nextButton.layout.top().trailing(constant: -16)
        closeButton.layout.leading(constant: 16).centerY(equalTo: nextButton.centerYAnchor)
        wsNameTextField.layout.leading(constant: 16).trailing(constant: -16).centerY(constant: -115)
        floatLabel.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
        
        indicatorViewLeadingConst = floatLabel.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
        indicatorViewLeadingConst.isActive = true
    }
    

    @objc private func didTapNextButton(_ sender: UIButton) {
        
    }
    
    @objc private func didTapCloseButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension ThirdViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = wsNameTextField.text!
        
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        
        indicatorViewLeadingConst.constant = textSize.width + 10
        
        if wsNameTextField.text! == "error" {
            print("error")
        }
        
        return true
    }
}
