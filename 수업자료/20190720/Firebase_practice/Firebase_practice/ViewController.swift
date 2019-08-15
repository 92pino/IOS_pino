//
//  ViewController.swift
//  Firebase_practice
//
//  Created by JinBae Jeong on 2019/07/20.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    var remoteConfig: RemoteConfig!
    
    let wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let helloTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이름 (필수)"
        
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "김애플"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return textField
    }()
    
    let birthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "생년월일 (선택)"
        
        return label
    }()
    
    let birthTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "19921121"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 (필수)"
        
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "test@fastcampus.co.kr"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return textField
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "상태메시지"
        
        return label
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("입력하기", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "입력하기"
        
        view.addSubview(wrapView)
        wrapView.backgroundColor = .red
        wrapView.addSubview(helloTextLabel)
        wrapView.addSubview(nameLabel)
        wrapView.addSubview(nameTextField)
        wrapView.addSubview(birthLabel)
        wrapView.addSubview(birthTextField)
        wrapView.addSubview(emailLabel)
        wrapView.addSubview(emailTextField)
        wrapView.addSubview(statusLabel)
        wrapView.addSubview(saveButton)
        
        configureAutoLayout()
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            wrapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            wrapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            wrapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            helloTextLabel.topAnchor.constraint(equalTo: wrapView.topAnchor),
            helloTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: helloTextLabel.bottomAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: wrapView.widthAnchor),
            birthLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            birthLabel.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            birthTextField.topAnchor.constraint(equalTo: birthLabel.bottomAnchor, constant: 20),
            birthTextField.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            birthTextField.widthAnchor.constraint(equalTo: wrapView.widthAnchor),
            emailLabel.topAnchor.constraint(equalTo: birthTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalTo: wrapView.widthAnchor),
            statusLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            statusLabel.centerXAnchor.constraint(equalTo: wrapView.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 100),
            saveButton.centerXAnchor.constraint(equalTo: wrapView.centerXAnchor),
        ])
    }
    
//    @objc private func saveData() {
//        self.saveUserInfo()
//    }
//    
//    private func saveUserInfo() {
//        //MARK: Firebase Database에 새로운 내용을 입력합니다.
//        guard let name = nameTextField.text,
//            let email = emailTextField.text else {
//                return
//        }
//        let birthday = birthTextField.text ?? ""
//        
//        let userInfo = [
//            "name": name,
//            "birthday": birthday,
//            "email": email
//        ]
//        
//        self.ref
//            .child("users")
//            .childByAutoId()
//            .setValue(userInfo) { [weak self] error, _ in
//                if let `error` = error {
//                    presentAlert(base: self, type: .submitFailed(error: error))
//                } else {
//                    self?.statusLabel.text = "데이터가 성공적으로 저장되었습니다."
//                }
//            }
//    }
    
}
