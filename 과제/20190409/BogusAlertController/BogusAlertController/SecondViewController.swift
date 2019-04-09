//
//  SecondViewController.swift
//  BogusAlertController
//
//  Created by JinBae Jeong on 09/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = ViewController()
        
        let alertView = UIView()
        let alertTitle = UILabel()
        let alertFirstButton = UIButton(type: .system)
        let alertLastButton = UIButton(type: .system)
        let dismissButton = UIButton(type: .system)
        
        alertView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        alertView.frame = CGRect(x: 30, y: view.frame.height / 2 - 250, width: view.frame.width - 60, height: 500)
        alertView.layer.cornerRadius = 15
        
        alertTitle.text = "색을 변경하시겠습니까?"
        alertTitle.textColor = .white
        alertTitle.frame = CGRect(x: 0, y: 30, width: alertView.frame.width, height: 50)
        alertTitle.textAlignment = .center
        alertTitle.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        alertFirstButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        alertFirstButton.setTitle("노랑", for: .normal)
        alertFirstButton.layer.cornerRadius = 50
        alertFirstButton.frame = CGRect(x: 20, y: 250, width: 100, height: 100)
        alertFirstButton.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        alertLastButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        alertLastButton.setTitle("흰색", for: .normal)
        alertLastButton.layer.cornerRadius = 50
        alertLastButton.frame = CGRect(x: 230, y: 250, width: 100, height: 100)
        alertLastButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        alertFirstButton.addTarget(vc, action: #selector(FirstchangeColor(_:)), for: .touchUpInside)
        alertLastButton.addTarget(vc, action: #selector(LastchangeColor(_:)), for: .touchUpInside)
        
        dismissButton.setTitle("확인", for: .normal)
        dismissButton.backgroundColor = .white
        dismissButton.frame = CGRect(x: 30, y: 400, width: view.frame.width - 100, height: 50)
        dismissButton.layer.cornerRadius = 25
        
        dismissButton.addTarget(self, action: #selector(dismissBtn(_:)), for: .touchUpInside)
        
        view.addSubview(alertView)
        alertView.addSubview(alertTitle)
        alertView.addSubview(alertFirstButton)
        alertView.addSubview(alertLastButton)
        alertView.addSubview(dismissButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func FirstchangeColor(_ sender: Any) {
        self.presentingViewController?.view.backgroundColor = .yellow
    }
    
    @objc func LastchangeColor(_ sender: Any) {
        self.presentingViewController?.view.backgroundColor = .white
    }
    
    @objc func dismissBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

}
