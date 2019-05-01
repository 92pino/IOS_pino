//
//  AppDelegate.swift
//  Notification_Homework
//
//  Created by JinBae Jeong on 30/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      window = UIWindow(frame: UIScreen.main.bounds)
      let firstVC = FirstViewController()
      let secondVC = SecondViewController()
      
      firstVC.tabBarItem = UITabBarItem(title: "firstVC", image: nil, tag: 0)
      secondVC.tabBarItem = UITabBarItem(title: "secondVC", image: nil, tag: 1)
      
      let tabbarVC = UITabBarController()
      tabbarVC.setViewControllers([firstVC, secondVC], animated: true)
      
      window?.rootViewController = tabbarVC
      window?.makeKeyAndVisible()
      
        
        
        
        return true
    }
    
}
