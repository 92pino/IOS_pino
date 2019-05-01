//
//  AppDelegate.swift
//  TableViewSection
//
//  Created by JinBae Jeong on 01/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let firstVC = FirstViewController()
    firstVC.title = "Table"
    
    let secondVC = SecondViewController()
    secondVC.title = "Fake"
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [firstVC, secondVC]
    
    window?.rootViewController = tabBarController
    
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

