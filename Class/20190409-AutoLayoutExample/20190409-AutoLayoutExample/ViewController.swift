//
//  ViewController.swift
//  20190409-AutoLayoutExample
//
//  Created by JinBae Jeong on 09/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 앱 호출 순서
    // viewWillAppear -> viewWillLayoutSubviews -> viewDidLayoutSubviews -> viewDidAppear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        //iPhone8 (20, 0, 0, 0)
        //iPhoneX 시리즈 (44, 0, 34, 0)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var redView = UIView()
        var blueView = UIView()
        
        view.addSubview(redView)
        view.addSubview(blueView)
        // (0, 0, 0, 0) top, left, bottom, right
        // iPhone x이상부터 사용
        print("viewDidLoad :", view.safeAreaInsets)
        print("status :", UIApplication.shared.statusBarFrame)
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        
        print("viewWillLayoutSubviews :", view.safeAreaInsets)
        
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right    // 세로일 때 0, 가로일 떄 88
        
        // iPhone8 - 20 + 20, iPhoneX = 44 + 20
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin
        
        redView.frame = CGRect(
            x : safeLayoutInsets.left + margin,
            y : yOffset,
            width : viewWidth,
            height : view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin)
        )
        
        blueView.frame = CGRect(
            origin: CGPoint(x: redView.frame.maxX + padding, y : yOffset), size: redView.bounds.size
        )
        
    }

}

