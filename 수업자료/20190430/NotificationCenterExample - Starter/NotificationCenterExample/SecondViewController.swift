//
//  SecondViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
  
  @IBOutlet private weak var colorView: UIView!
  @IBOutlet private weak var numberLabel: UILabel!
  
  @IBOutlet private weak var colorNotiButton: UIButton!
  @IBOutlet private weak var plusNotiButton: UIButton!
  
  let notiCenter = NotificationCenter.default
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addNotificationObserver()
  }
  
  // MARK: - Add Notification Oberserver
  
  func addNotificationObserver() {
    /***************************************************
     addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
     - 파라미터 정보
     > observer: 옵저버를 등록할 객체
     > selector: 지정한 알림이 발생했을 때 반응할 메서드
     > name: 알림을 구분하기 위한 이름
     > object: 특정 객체를 지정하면 그것을 통해 발생하는 알림만 등록, nil이면 전체
     
     - 중복하여 등록하면 메서드 중복 실행
     ***************************************************/
    
    // ColorNotification
  
    
    // Plus Notification
    
  }
  
  
  // MARK: - Random Color Notification
  
  @IBAction func postRandomColorNotification(_ sender: Any) {
  }
  
  @objc func didReceiveRandomColorNotification(_ sender: Notification) {
  }
  
  
  
  // MARK: - Plus Notification
  
  @IBAction func postPlusNotification(_ sender: Any) {
  }
  
  @objc func didReceivePlusNotification(_ sender: Notification) {
  }
  
  
  // MARK: - Remove Notification Observer
  
  func removeNotificationObserver() {
    /***************************************************
     removeObserver(<#T##observer: Any##Any#>)
     - 지정 객체에 등록한 모든 옵저버를 제거
     
     removeObserver(<#T##observer: Any##Any#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
     - 지정 객체에 등록한 옵저버 중 특정 이름을 가진 것만 선택하여 제거
     - object가 nil일 경우, 해당 이름을 가진 옵저버 모두 제거
       object에 특정 객체를 지정할 경우 해당 객체로 등록한 옵저버에 대해서만 제거
     
     > 일반적으로
     viewDidLoad <-> deinit
     viewWill/DidAppear <-> viewWill/DidDisappear
     ***************************************************/
  }
}

