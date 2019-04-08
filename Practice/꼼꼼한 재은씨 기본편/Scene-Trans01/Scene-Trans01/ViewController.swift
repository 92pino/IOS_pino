//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        // 이동할 뷰 컨트롤러 객체를 storyboardID 정보를 이용하여 참조
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        // 화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // 인자값으로 뷰 컨트롤러 인스턴트를 넣고 프레젠트 메소드를 호출
        present(uvc, animated: true)
    }
    
}

