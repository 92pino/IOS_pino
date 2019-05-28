//
//  ContainerViewController.swift
//  StatusBarAndHomeIndicatorExample
//
//  Created by JinBae Jeong on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ContainerViewController: UINavigationController {

    /*
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
     */
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        return topViewController
    }

}
