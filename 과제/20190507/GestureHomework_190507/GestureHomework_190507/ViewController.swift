//
//  ViewController.swift
//  GestureHomework_190507
//
//  Created by JinBae Jeong on 07/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var countText: UILabel!
  @IBOutlet weak var position: UILabel!
  
  var startFlag = CGPoint(x: 0, y: 0)
  var count: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tapGestureSetting()
  }
  
  func tapGestureSetting() {
    let touchGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
    touchGesture.numberOfTapsRequired = 1
    touchGesture.numberOfTouchesRequired = 1
    view.addGestureRecognizer(touchGesture)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    guard let touch = touches.first else { return }
    // 어느 위치를 찍었는지에 대한 좌표 정보
    let touchPoint = touch.location(in: touch.view)
    
  }
  
  @objc func tapGesture(_ sender: UITapGestureRecognizer){
    let touchPoint = sender.location(in: self.view)
    
    if abs(startFlag.x - touchPoint.x) >= 10 || abs(startFlag.y - touchPoint.y) >= 10 {
      count = 0
      print("초기화", abs(startFlag.x - touchPoint.x), abs(startFlag.y - touchPoint.y))
    }
//
    if count == 0 {
      startFlag = touchPoint
    }
    
    count += 1
//
    countText.text = "\(count)"
    position.text = "좌표 : (\(String(format: "%.3f", arguments: [touchPoint.x])), \(String(format: "%.3f", arguments: [touchPoint.y])))"
    
    print(count)
    
  }

}
