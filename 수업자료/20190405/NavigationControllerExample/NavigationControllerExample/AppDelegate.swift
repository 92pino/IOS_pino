//
//  AppDelegate.swift
//  NavigationControllerExample
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 윈도우 만들기
        window = UIWindow(frame: UIScreen.main.bounds)
        // default backgroundColor는 .black이여서 white로 변경
        window?.backgroundColor = .white
        
        // 실제 뷰 컨텐츠를 표현할 내용을 만들기 위한 선언
        let vc = ViewController()
        // 네비게이션컨트롤러 생성
        let naviController = UINavigationController(rootViewController: vc)
        // 루트뷰 컨트롤러로 네비게이션 컨트롤러와 컨텐츠 생성
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
        
        return true
    }
}

