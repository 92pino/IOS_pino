//
//  ViewController.swift
//  UserNotificationExample
//
//  Created by giftbot on 2019. 5. 28..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var titleTextField: UITextField!
  @IBOutlet private weak var timeIntervalLabel: UILabel!
  @IBOutlet private weak var minuteTextField: UITextField!
  @IBOutlet private weak var secondTextField: UITextField!
  
  let notiManger = UNNotificationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    notiManger.getNotificationSetting { isGranted in
        if isGranted {
            // noti 발생 코드
        } else {
            // do nothing || noti 권한 허용 요청 Alert
        }
    }
  }
  
  
  @IBAction private func didEndOnExit(_ sender: UITextField) {}
  
  var backupNumber = 0
  @IBAction private func editingChangedForCalendar(_ sender: UITextField) {
    guard let text = sender.text, !text.isEmpty, let number = Int(text) else { return }
    guard number < 60 else { return sender.text = String(backupNumber) }
    backupNumber = number
    sender.text = String(backupNumber)
  }
  
  @IBAction private func changeTimeInterval(_ sender: UIStepper) {
    timeIntervalLabel.text = String(Int(sender.value))
  }

    // add 버튼을 클릭할 경우 숫자에 해당하는 인터벌 길이만큼 실행
  @IBAction private func triggerTimeIntervalNotification(_ sender: Any) {
    let title = titleTextField.text ?? ""
    let notificationTitle = title.isEmpty ? "Reminder" : title
    let timeInterval = TimeInterval(timeIntervalLabel.text!) ?? 3.0
    notiManger.triggerTimeIntervalNotification(
        with: notificationTitle, timeInterval: timeInterval
    )
  }
  
  
  @IBAction private func triggerCalendarNotification(_ sender: Any) {
    let title = titleTextField.text ?? ""
    let notificationTitle = title.isEmpty ? "Reminder" : title
    
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.minute = Int(minuteTextField.text ?? "0") ?? 0
    dateComponents.second = Int(secondTextField.text ?? "0") ?? 0
    
    notiManger.triggerCalendarNotification(
        with: notificationTitle,
        dateComponents: dateComponents
    )
  }
}

