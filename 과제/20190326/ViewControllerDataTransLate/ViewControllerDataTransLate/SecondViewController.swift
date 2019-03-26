//
//  SecondViewController.swift
//  ViewControllerDataTransLate
//
//  Created by JinBae Jeong on 26/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var labelTxt = UILabel()
    var viewButton = UIButton(type: .system)
    var txt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        labelTxt.frame = CGRect(x: view.frame.width / 2 - 25, y: 100, width: 50, height: 50)
        labelTxt.text = "0"
    
        viewButton.frame = CGRect(x: view.frame.width / 2 - 100, y: 200, width: 200, height: 50)
        viewButton.backgroundColor = .blue
        
        view.addSubview(viewButton)
        view.addSubview(labelTxt)
        
        viewButton.addTarget(self, action: #selector(dismissFirstVC), for: .touchUpInside)
    }
    
    @objc func dismissFirstVC(){
        guard let vc = presentingViewController as? ViewController else { return }
        vc.txt += 1
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let vc = presentingViewController as? ViewController else { return }
        labelTxt.text = String(vc.txt)
    }

}
