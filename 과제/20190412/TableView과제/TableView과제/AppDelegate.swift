//
//  AppDelegate.swift
//  TableView과제
//
//  Created by JinBae Jeong on 14/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupKeyWindow()
        return true
    }
    
    func setupKeyWindow() {
        let listVC = ViewController()
        let naviController = UINavigationController(rootViewController: listVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()

}

}
