//
//  ViewController.swift
//  TextField
//
//  Created by JinBae Jeong on 26/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

//[ 과제 ]
//1. 영상 참고
//          > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//        > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//      > 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

import UIKit

class ViewController: UIViewController {

    let txtLabel = UILabel()
    let txtField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtLabel.frame = CGRect(x: view.frame.width / 2 - 150, y: 100, width: 300, height: 100)
        txtLabel.textAlignment = .center
        txtLabel.text = ""
        view.addSubview(txtLabel)
        
        txtField.frame = CGRect(x: view.frame.width / 2 - 150, y: 300, width: 300, height: 50)
        txtField.borderStyle = .roundedRect
        txtField.textAlignment = .center
        txtField.clearButtonMode = .whileEditing
        view.addSubview(txtField)
        
        txtField.addTarget(self, action: #selector(textLabel), for: .editingChanged)
        txtField.addTarget(self, action: #selector(endLabel), for: .editingDidEndOnExit)
        txtField.addTarget(self, action: #selector(startLabel), for: .editingDidBegin)
        
    }

    @objc func textLabel() {
        txtLabel.text = txtField.text
    }
    
    @objc func startLabel() {
        txtLabel.textColor = .blue
        txtLabel.font = UIFont.boldSystemFont(ofSize: 40)
    }
    
    @objc func endLabel() {
        txtLabel.textColor = .red
        txtLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

