//
//  ViewController.swift
//  initProject
//
//  Created by JinBae Jeong on 22/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1.
    @IBOutlet weak var redView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var orangeView: UIView!
    @IBOutlet var helloWorld: UILabel!
    @IBOutlet var touchEvent: UIButton!
    @IBOutlet var changeBg: UIButton!
    @IBOutlet var changeSecBg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // backgroundColor 변경
        view.backgroundColor = .yellow
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        orangeView.backgroundColor = .orange
        
        let txt: String = "Hello World!"
        
        helloWorld.text = txt
        
        touchEvent.addTarget(self, action: #selector(btnDidTap(_:)), for: .touchUpInside)
        
        changeBg.addTarget(self, action: #selector(boxChange(_:)), for: .touchUpInside)
        changeSecBg.addTarget(self, action: #selector(secBoxChange(_:)), for: .touchUpInside)
    }
    
    @objc func btnDidTap(_ button: UIButton) {
        print("=================== btnDidTap ===================")
        print(button)
    }
    
    @objc func boxChange(_ sender: Any) {
        blueView.backgroundColor = .purple
    }
    @objc func secBoxChange(_ button: UIButton) {
        orangeView.backgroundColor = .white
    }

    
    @IBAction func clickBtn(_ sender: Any) {
        helloWorld.text = "텍스트가 변경되었습니다."
        print(sender)
        
        redView.backgroundColor = .green
    }
    
}

