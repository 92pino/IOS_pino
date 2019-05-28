//
//  UNNotificationManager.swift
//  UserNotificationExample
//
//  Created by giftbot on 2019. 5. 28..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit


final class UNNotificationManager: NSObject {
  enum Identifier {
    static let basicCategory = "BasicCategory"
    static let anotherCategory = "AnotherCategory"
    
    static let timeIntervalRequest = "TimeIntervalRequest"
    static let calendarRequest = "CanlendarRequest"
    
    static let repeatAction = "RepeatAction"
    static let removeAction = "RemoveAction"
    static let textInputAction = "TextInputAction"
  }
  
  func register() {
  }

  
  /***************************************************
   SetupNotificationCategories
   ***************************************************/
  
  func setupNotificationCategories() {
  }
  
  
  
  /***************************************************
   TimeIntervalNotification - TimeInterval로 지정한 시간(초) 이후로 알림 등록
   ***************************************************/
  
  func triggerTimeIntervalNotification(with title: String, timeInterval: TimeInterval = 3.0) {
  }
  
  
  
  /***************************************************
   CalendarNotification - 특정 날짜/시간을 지정하여 알림 등록
   ***************************************************/
  
  func triggerCalendarNotification(with title: String, dateComponents: DateComponents) {
    
  }
  
}


