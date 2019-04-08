//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveyNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.present(uvc, animated: true)
    }
    
    @IBAction func movePush(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
}

