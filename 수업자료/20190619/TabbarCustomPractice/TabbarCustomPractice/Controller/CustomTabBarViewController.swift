//
//  CustomTabBarViewController.swift
//  TabbarCustomPractice
//
//  Created by JinBae Jeong on 19/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {

    // MARK: - Properties
    
    let menuBar = MenuBar()
    
    var menuTitles = ["menu1", "menu2", "menu3", "menu4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTabBar()
    }
    
    private func configureCustomTabBar() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        
        let guide = view.safeAreaLayoutGuide
        
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
    }
    
}
