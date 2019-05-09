//
//  ViewController.swift
//  DisplayTouchPoint
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var tapCountLabel: UILabel!
  @IBOutlet private weak var tapPointLabel: UILabel!

  /***************************************************
   1) touchesBegan 메서드 이용
   ***************************************************/
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first else { return }
    tapCountLabel.text = "횟수 : \(touch.tapCount)"

    let tapPoint = touch.location(in: view)
    tapPointLabel.text = "좌표 : \(tapPoint)"
  }

  
  /***************************************************
   2) UITapGestureRecognizer 이용
   ***************************************************/
  
  var lastTapPoint = CGPoint.zero
  var tapCount = 0
  @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
//    let tapPoint = sender.location(in: view)
//    tapPointLabel.text = "좌표 : \(tapPoint)"
//
//    let xDistance = pow(lastTapPoint.x - tapPoint.x, 2)
//    let yDistance = pow(lastTapPoint.y - tapPoint.y, 2)
//    let distance = sqrt(xDistance + yDistance)
//    if distance > 10 {
//      tapCount = 0
//    }
//    tapCount += 1
//    tapCountLabel.text = "횟수 : \(tapCount)"
//
//    lastTapPoint = tapPoint
  }
  
}
