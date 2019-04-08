//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
