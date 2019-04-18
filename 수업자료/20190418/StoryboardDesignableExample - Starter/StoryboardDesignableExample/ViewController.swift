//
//  ViewController.swift
//  StoryboardDesignableExample
//
//  Created by 이봉원 on 12/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var customButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(customButton.someValue)
        updateViewConstraints()
    }
}
