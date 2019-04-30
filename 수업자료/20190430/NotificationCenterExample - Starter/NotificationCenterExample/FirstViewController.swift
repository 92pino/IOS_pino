//
//  FirstViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {
  
  @IBOutlet private weak var myTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Swift 4.2+
    // 싱글톤으로 관찰자를 뷰에 다는 것임
    // 뷰 디드로드에만 한번 등록해야함(뷰 윌 어피어에 등록하면 여러개를 다는 것이 될 수 있음)
    NotificationCenter.default.addObserver(self,
      selector: #selector(didReceiveKeyboardNotification(_:)),
      name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self,
      selector: #selector(didReceiveKeyboardNotification(_:)),
      name: UIResponder.keyboardWillHideNotification, object: nil)
    
    NotificationCenter.default.addObserver(self,
      selector: #selector(testNotificarion(_:)),
      name: UIApplication.didBecomeActiveNotification, object: nil)
    
    
    // UIResponder.keyboardWillHideNotification
    // UIResponder.keyboardWillShowNotification
    
    // UIApplication.didBecomeActiveNotification
    
  }
  
  @IBAction private func didEndOnExit(_ sender: Any) {}
 
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc func testNotificarion(_ noti: Notification) {
    print("didBecomeActiveNotification")
  }
  
  
  
  @objc func didReceiveKeyboardNotification(_ noti:Notification) {
    guard let userInfo = noti.userInfo,
      let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
      let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
    
      print(keyboardFrame)  // 키보드 프레임 알아보기
    
    
    UIView.animate(withDuration: duration) {
      
      if keyboardFrame.minY >= self.view.frame.maxY {
        self.myTextField.frame.origin.y += keyboardFrame.height
      } else {
        self.myTextField.frame.origin.y -= keyboardFrame.height
      }
    }
  }

}

