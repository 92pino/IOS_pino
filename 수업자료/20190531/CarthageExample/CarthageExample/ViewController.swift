//
//  ViewController.swift
//  CarthageExample
//
//  Created by JinBae Jeong on 31/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import DynamicColor

class ViewController: UIViewController {

    @IBOutlet var circles: [UIView]!
    
    @IBOutlet var circle1: UIView!
    @IBOutlet var circle2: UIView!
    @IBOutlet var circle3: UIView!
    @IBOutlet var circle4: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circles.forEach {
            $0.layer.cornerRadius = 40
        }
        
        var circles2 = [circle1, circle2, circle3, circle4].forEach {
            $0.layer.cornerRadius = 40
        }
        
        let blue   = UIColor(hexString: "#3498db")
        let red    = UIColor(hexString: "#e74c3c")
        let yellow = UIColor(hexString: "#f1c40f")
        
        let gradient = DynamicGradient(colors: [blue, red, yellow])
        let labPalette = gradient.colorPalette(amount: 8, inColorSpace: .lab)
        circles.enumerated().forEach { $1.backgroundColor = labPalette[$0] }
        
        let color = DynamicColor(hexString: "#c0392b")
        circle1.backgroundColor = color
        circle2.backgroundColor = color.darkened()
        circle3.backgroundColor = color.inverted()
        
        let mixedColor = color.mixed(withColor: .white)
        circle4.backgroundColor = mixedColor
    }


}

