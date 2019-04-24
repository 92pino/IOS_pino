//
//  ViewController.swift
//  NavigationControllerExample
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "First VC"
        
        // iOS 11부터 적용
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        let barButton = UIBarButtonItem(title: "Push", style: .done, target: self, action: #selector(pushViewController(_:)))
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }


}

