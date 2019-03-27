//
//  ViewController.swift
//  AlertCosntrollerTutorial
//
//  Created by JinBae Jeong on 25/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 다른곳에서도 반복적으로 사용할 경우 외부로 상수를 꺼내놓는다.
    let button = UIButton(type: .system)
    var count = 0
    
    @IBOutlet var btn02: UIButton!
    @IBOutlet var btn03: UIButton!
    @IBOutlet var upLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 코드로 작성
        button.frame = CGRect(x: 250, y: 100, width: 150, height: 35)
        button.setTitle("버튼 코드로 작성", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        
        btn03.addTarget(self, action: #selector(upBtn(_:)), for: .touchUpInside)
        btn02.addTarget(self, action: #selector(btnTest(_:)), for: .touchUpInside)
        upLabel.text = "\(count)"
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .actionSheet)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(voidAction)
        present(alertController, animated: true)
    }
    let voidAction = UIAlertAction(title: "Void", style: .destructive) { _ in
        print("Do Nothing")
    }
    
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        print("OK")
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    
    @objc func btnTest(_ sender: Any){
        let alertController = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .alert)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(voidAction)
        present(alertController, animated: true)
    }
    
    /* 0이라는 레이블에 버튼 클릭 후 up을 클릭시 1씩 add */
    @objc func upBtn(_ sender: Any) {
    
        let upAction = UIAlertAction(title: "+1", style: .default) { _ in
            self.count += 1
            
            self.upLabel.text = "\(self.count)"
        }
        
        
        
        alertController.addAction(upAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

