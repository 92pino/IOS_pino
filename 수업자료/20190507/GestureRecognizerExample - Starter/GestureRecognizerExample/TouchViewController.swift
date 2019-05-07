//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  var isHoldingImage = false
  var diffx: CGFloat = 0
  var diffy: CGFloat = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleImageView()
  }
  
  // 이미지뷰 layer 기능
  func styleImageView(){
    imageView.layer.cornerRadius = imageView.frame.width / 2
    
    // 이미지뷰를 벗어나는 영역은 잘라버리는 기능
    // 1. maskToBounds
    //    imageView.layer.masksToBounds = true
    
    // 2. clipsToBounds
    imageView.clipsToBounds = true
  }
  
  // 터치를 인식하는 시점
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    // 터치한 곳의 정보가 들어옴
    // print(touches)
    
    // 손가락중 제일 먼저 반응한것
    guard let touch = touches.first else { return }
    // 어느 위치를 찍었는지에 대한 좌표 정보
    let touchPoint = touch.location(in: touch.view)
    
    if imageView.frame.contains(touchPoint) {
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
    }
    
    diffx = touchPoint.x - imageView.frame.origin.x
    diffy = touchPoint.y - imageView.frame.origin.y
  }
  
  // 터치 후 움직일때 시점
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    
    // 손가락중 제일 먼저 반응한것
    guard isHoldingImage, let touch = touches.first else { return }
    // 어느 위치를 찍었는지에 대한 좌표 정보
    let touchPoint = touch.location(in: touch.view)
    
    imageView.frame.origin.x = touchPoint.x - diffx
    imageView.frame.origin.y = touchPoint.y - diffy
    
    
  }
  
  // 터치를 뗏을때 시점
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    
    // 손가락중 제일 먼저 반응한것
    guard let touch = touches.first else { return }
    // 어느 위치를 찍었는지에 대한 좌표 정보
    let touchPoint = touch.location(in: touch.view)
    
    isHoldingImage = false
    imageView.image = UIImage(named: "cat1")
  }
  
  // 터치를 하고 있다가 다른 상황에 의해 방해 받을때 생기는 시점
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    // 손가락중 제일 먼저 반응한것
    guard let touch = touches.first else { return }
    // 어느 위치를 찍었는지에 대한 좌표 정보
    let touchPoint = touch.location(in: touch.view)
    
    isHoldingImage = false
    imageView.image = UIImage(named: "cat1")
  }
  
}



