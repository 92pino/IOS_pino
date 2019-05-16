//
//  AppDelegate.swift
//  slackCopy
//
//  Created by JinBae Jeong on 16/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let main = FirstViewController()
        
        window?.rootViewController = main
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

