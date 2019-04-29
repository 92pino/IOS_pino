//
//  AppDelegate.swift
//  DominoPizza
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let wishListVC = WishListViewController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        let categoryVC = CategoryViewController()
        categoryVC.title = "Domino's"
        wishListVC.title = "Wish List"
        
        let orderNavi = UINavigationController.init(rootViewController: categoryVC)
        let wishNavi = UINavigationController.init(rootViewController: wishListVC)
        
        orderNavi.tabBarItem = UITabBarItem(title: "Domino's", image: nil, selectedImage: nil)
        wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, selectedImage: nil)
        tabBarController.viewControllers = [orderNavi, wishNavi]
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

