//
//  ContentViewController.swift
//  StatusBarAndHomeIndicatorExample
//
//  Created by giftbot on 2019. 5. 28..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ContentViewController: UIViewController {
  
    // default : 상태바 기본 (black)
    // lightContent : 상태바 흰색으로 만들기
  private var statusBarStyle = UIStatusBarStyle.default
  private var isStatusBarHidden = false
  private var isHomeIndicatorAutoHidden = false
  
  // MARK: StatusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        // slide, fade(default), none
        // slide의 경우 상태바가 위 아래로 애니메이션
        // fade의 경우 fadeIn fadeOut
        // none의 경우 한번에 사라지고 나타남
        
        // 일반적으로 slide 사용할듯???
        return .slide
    }
  
  // MARK: HomeIndicator
    override var prefersHomeIndicatorAutoHidden: Bool {
        return isHomeIndicatorAutoHidden
    }
  
  
  // MARK: Action Handler
  
  @IBAction private func toggleStatusBarStyle(_ sender: Any) {
    let isDefault = statusBarStyle == .default
    statusBarStyle = isDefault ? .lightContent : .default
    
    UIView.animate(withDuration: 0.5) {
        // statusBarStyle의 상태가 변경되었으면 업데이트 해서 barstyle을 적용시키는 메소드
        self.view.backgroundColor = !isDefault ? .white : .darkGray
        self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  @IBAction private func toggleStatusBarHidden(_ sender: Any) {
    isStatusBarHidden.toggle()
    UIView.animate(withDuration: 0.5) {
        self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  @IBAction private func toggleHomeIndicatorHidden(_ sender: Any) {
    isHomeIndicatorAutoHidden.toggle()
    setNeedsUpdateOfHomeIndicatorAutoHidden()
  }
}
