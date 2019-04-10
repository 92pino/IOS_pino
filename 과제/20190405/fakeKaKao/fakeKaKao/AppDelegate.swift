//
//  AppDelegate.swift
//  fakeKaKao
//
//  Created by JinBae Jeong on 10/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tabBarController = UITabBarController()
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let 
        
        return true
    }
    
    
}

