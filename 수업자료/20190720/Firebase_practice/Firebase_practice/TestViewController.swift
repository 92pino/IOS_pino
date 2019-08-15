//
//  TestViewController.swift
//  Firebase_practice
//
//  Created by JinBae Jeong on 2019/07/20.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Firebase

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = FirebaseCenter.shared.getData()
        
        print("@@@ :", text)
        
        if let report = try? decoder.decode([CardData].self, from: te) {
            print("Name :", report[0].name)
            report[0].favoriteMovies.forEach { print($0) }
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
