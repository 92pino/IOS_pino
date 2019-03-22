//
//  ViewController.swift
//  HomeWork_20190322
//
//  Created by JinBae Jeong on 22/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var onOffSwitch: UISwitch!
    @IBOutlet var onOffLabel: UILabel!
    @IBOutlet var segementFunc: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .lightGray
        onOffLabel.textColor = .white
        
        segementFunc.addTarget(self, action: #selector(segment(_:)), for: .valueChanged)
        
    }
    
    @IBAction func remoteFunc(_ sender: Any) {
        if onOffSwitch.isOn == true {
            onOffLabel.text = "ON"
        } else {
            onOffLabel.text = "OFF"
        }
    }
    
    @objc func segment(_ sender: Any) {
        if segementFunc.selectedSegmentIndex == 0 {
            onOffLabel.text = segementFunc.titleForSegment(at: segementFunc.selectedSegmentIndex)
        } else {
            onOffLabel.text = segementFunc.titleForSegment(at: segementFunc.selectedSegmentIndex)
        }
    }
    
    
    


}

