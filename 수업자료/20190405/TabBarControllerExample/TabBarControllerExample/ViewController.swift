//
//  ViewController.swift
//  TabBarControllerExample
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstVC"
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(pushButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func pushButton(_ sender: UIButton){
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    /***********************************************************************
     
    실행하자마자
     A viewDidLoad
     A viewWillAppear
     A viewDidAppear
     
    두번째 탭바 클릭시
     B viewDidLoad
     B viewWillAppear
     A viewWillDisappear
     A viewDidDisappear
     B viewDidAppear
    
    첫번째 탭바 클릭 이후 반복
     A viewWillAppear
     B viewWillDisappear
     B viewDidDisappear
     A viewDidAppear
     
    ***********************************************************************/


}

