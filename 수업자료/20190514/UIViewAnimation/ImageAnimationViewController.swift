//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2019. 5. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
    // UIImage 타입으로 생성
    let images = [
        "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    ].compactMap(UIImage.init(named:))
    
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.animationImages = images
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating()
  }
  
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    
    // 1 Cycle
    // default: 0.0 - 1/30 Second
    imageView.animationDuration = sender.value
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount)"
    
    // default: 0 - Indefinitely(default일 경우 무한으로 돈다)
    imageView.animationRepeatCount = Int(sender.value)
  }
}
