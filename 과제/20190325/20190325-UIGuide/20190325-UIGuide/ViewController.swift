//
//  ViewController.swift
//  20190325-UIGuide
//
//  Created by JinBae Jeong on 25/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let superView = UIView()
        
        superView.frame = CGRect(x: 30, y: 30, width: view.frame.width - 60, height: view.frame.height - 60)
        
        superView.backgroundColor = .blue
        
        view.addSubview(superView)
        
        let subView = UIView()
        
        subView.frame = CGRect(x: 30, y: 30, width: superView.frame.width - 60, height: superView.frame.height - 60)
        
        subView.backgroundColor = .red
        
        superView.addSubview(subView)
        
        let lastView = UIView()
        
        lastView.frame = CGRect(x: 30, y: 30, width: subView.frame.width - 60, height: subView.frame.height - 60)
        
        lastView.backgroundColor = .green
        
        subView.addSubview(lastView)
    }


}

