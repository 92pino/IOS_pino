//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifier: \(segue.identifier!)")
    }
}

