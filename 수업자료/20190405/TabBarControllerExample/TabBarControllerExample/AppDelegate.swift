//
//  AppDelegate.swift
//  TabBarControllerExample
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tabBarController = UITabBarController()
        let firstVC = ViewController()
        
        let navi = UINavigationController(rootViewController: firstVC)
        
        let secondVC = SecondViewController()
        secondVC.title = "SecondVC"

        tabBarController.viewControllers = [navi, secondVC]
        
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

