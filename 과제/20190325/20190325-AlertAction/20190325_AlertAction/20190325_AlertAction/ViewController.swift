//
//  ViewController.swift
//  20190325_AlertAction
//
//  Created by JinBae Jeong on 25/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var upLabel = UIButton(type: .system)
    var downLabel = UIButton(type: .system)
    var label = UILabel()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        upLabel.frame = CGRect(x: view.frame.width / 2 - 75, y: 300, width: 150, height: 35)
        upLabel.backgroundColor = .cyan
        upLabel.setTitle("증가 or 감소", for: .normal)
        
        upLabel.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(upLabel)
        
        label.text = "0"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: view.frame.width / 2 - 25, y: 100, width: 50, height: 50)
        view.addSubview(label)
    }
    
    @objc func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "" , message: "증가 or 감소?", preferredStyle: .actionSheet)
        
        let upAction = UIAlertAction(title: "증가", style: .default) { _ in
            self.count += 1
            
            self.label.text = "\(self.count)"
        }
        
        let downAction = UIAlertAction(title: "감소", style: .default) { _ in
            self.count -= 1
            
            self.label.text = "\(self.count)"
        }
        
        let reset = UIAlertAction(title: "초기화", style: .default) { _ in
            self.count = 0
            
            self.label.text = "\(self.count)"
        }
        
        alertController.addAction(upAction)
        alertController.addAction(downAction)
        alertController.addAction(reset)
        present(alertController, animated: true)
    }
    
    


}

