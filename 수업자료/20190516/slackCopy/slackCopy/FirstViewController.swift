//
//  ViewController.swift
//  slackCopy
//
//  Created by JinBae Jeong on 16/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // ViewController가 생성될 때 만들어지는 것
    private let createWSButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.addTarget(self, action: #selector(didTapCreateWSButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(createWSButton)
        
        createWSButton.layout.centerX().centerY()
        
        /*
        createWSButton.translatesAutoresizingMaskIntoConstraints = false
        createWSButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createWSButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         */
    }
    
    @objc func didTapCreateWSButton(_ sender: UIButton) {
        let vc = CreateWorkspaceViewController()
        let naviController = UINavigationController(rootViewController: vc)
        present(naviController, animated: true)
    }
}

