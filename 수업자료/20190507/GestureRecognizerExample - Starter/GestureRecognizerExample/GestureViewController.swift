//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
  }
  
  var isQuadruple = false
  @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
    if !isQuadruple {
      imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
    } else {
    // 원본 사이즈로 돌아가는 기능
    imageView.transform = CGAffineTransform.identity
    }
    isQuadruple.toggle()
  }
  
  @IBAction func handleRotationsGesture(_ sender: UIRotationGestureRecognizer) {
    let rotation = sender.rotation
    imageView.transform = imageView.transform.rotated(by: rotation)
    sender.rotation = 0
    
//    imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
  }
  
  @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    if sender.direction == .right {
      imageView.image = UIImage(named: "cat1")
    } else if sender.direction == .left {
      imageView.image = UIImage(named: "cat2")
    }
  }
}

