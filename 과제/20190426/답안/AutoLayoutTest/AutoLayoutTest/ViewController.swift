//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var greenView: UIView!
  @IBOutlet private weak var navyBlueView: UIView!
  @IBOutlet private weak var skyBlueView: UIView!
  @IBOutlet private weak var fourthLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAutoLayout()
  }
  
  private func setupAutoLayout() {
    skyBlueView.translatesAutoresizingMaskIntoConstraints = false
    navyBlueView.translatesAutoresizingMaskIntoConstraints = false
    fourthLabel.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints: [NSLayoutConstraint] = []
    constraints.append(contentsOf: [
      skyBlueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      skyBlueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      skyBlueView.widthAnchor.constraint(equalTo: greenView.widthAnchor),
      skyBlueView.heightAnchor.constraint(equalTo: greenView.heightAnchor),
      
      navyBlueView.widthAnchor.constraint(equalTo: skyBlueView.widthAnchor, multiplier: 0.5, constant: 0),
      navyBlueView.heightAnchor.constraint(equalTo: skyBlueView.heightAnchor, multiplier: 0.5, constant: 0),
      navyBlueView.centerXAnchor.constraint(equalTo: skyBlueView.centerXAnchor),
      navyBlueView.centerYAnchor.constraint(equalTo: skyBlueView.centerYAnchor),
      
      fourthLabel.centerXAnchor.constraint(equalTo: navyBlueView.centerXAnchor, constant: 20),
      fourthLabel.centerYAnchor.constraint(equalTo: navyBlueView.centerYAnchor),
      fourthLabel.widthAnchor.constraint(greaterThanOrEqualTo: navyBlueView.widthAnchor, multiplier: 0.7),
      ])
    for const in constraints {
      const.isActive = true
    }
  }
  
}

