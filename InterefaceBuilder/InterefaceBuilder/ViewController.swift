//
//  ViewController.swift
//  InterefaceBuilder
//
//  Created by JinBae Jeong on 05/12/2018.
//  Copyright © 2018 JinBae Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("button tapped")
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("slider value changed")
    }
    
    
    

}

