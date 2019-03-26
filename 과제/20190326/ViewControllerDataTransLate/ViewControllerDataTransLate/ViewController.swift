//
//  ViewController.swift
//  ViewControllerDataTransLate
//
//  Created by JinBae Jeong on 26/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelTxt = UILabel()
    var viewButton = UIButton(type: .system)
    var txt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelTxt.frame = CGRect(x: view.frame.width / 2 - 25, y: 100, width: 50, height: 50)
        labelTxt.text = "0"
        
        viewButton.frame = CGRect(x: view.frame.width / 2 - 100, y: 200, width: 200, height: 50)
        viewButton.backgroundColor = .red
        
        view.addSubview(viewButton)
        view.addSubview(labelTxt)
        
        viewButton.addTarget(self, action: #selector(moveSecondVC), for: .touchUpInside)
    }
    
    @objc func moveSecondVC(){
        let secondVC = SecondViewController()
        txt += 1
        
        present(secondVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let secondVC = SecondViewController()
        labelTxt.text = String(txt)
    }
    

}

