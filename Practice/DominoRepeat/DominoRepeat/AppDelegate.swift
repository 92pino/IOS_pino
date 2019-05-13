//
//  AppDelegate.swift
//  DominoRepeat
//
//  Created by JinBae Jeong on 13/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame:UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    let categoryVC = UINavigationController(rootViewController: CategoryViewController())
    categoryVC.tabBarItem.title = "Domino's"
    
    let wishVC = UINavigationController(rootViewController: WishViewController())
    wishVC.tabBarItem.title = "Wish List"
    
    let tabBar = UITabBarController()
    tabBar.viewControllers = [categoryVC, wishVC]
    
    window?.rootViewController = tabBar
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

