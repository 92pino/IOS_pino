//
//  ViewController.swift
//  UIDeviceExample
//
//  Created by giftbot on 2019. 5. 4..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

/***************************************************
 UIDevice
 - 디바이스 이름 / 모델 / 화면 방향 등
 - OS 이름 / 버전
 - 인터페이스 형식 (phone, pad, tv 등)
 - 배터리 정보
 - 근접 센서 정보
 - 멀티태스킹 지원 여부
 ***************************************************/


final class ViewController: UIViewController {
  
  @IBOutlet private weak var label: UILabel!
  let device = UIDevice.current
  let notiCenter = NotificationCenter.default
  
  @IBAction private func systemVersion() {
    print("\n---------- [ System Version ] ----------\n")
    
  }
  
  @IBAction private func architecture() {
    print("\n---------- [ Architecture ] ----------\n")
    
  }
  
  @IBAction private func deviceModel() {
    print("\n---------- [ Device Model ] ----------\n")
    
  }
  
  
  // MARK: - Battery
  
  @IBAction private func battery() {
    print("\n-------------------- [ Battery Info ] --------------------\n")
    
  }
  
  @IBAction private func batteryMonitoring(_ sender: UIButton) {
    print("\n---------- [ batteryMonitoring ] ----------\n")
    
  }
  
  @objc func didChangeBatteryState(_ noti: Notification) {
    
  }
  
  
  // MARK: - Proximity State
  
  @IBAction private func proximityMonitoring(_ sender: UIButton) {
    print("\n-------------------- [ Proximity Sensor ] --------------------\n")
  }
  
  @objc func didChangeProximityState(_ noti: Notification) {
  }
  
  
  // MARK: - Orientation Notification
  
  @IBAction private func beginOrientationNotification() {
  }
  
  @objc func orientationDidChange(_ noti: Notification) {
  }
  
  @IBAction private func endOrientationNotification() {
  }
}





