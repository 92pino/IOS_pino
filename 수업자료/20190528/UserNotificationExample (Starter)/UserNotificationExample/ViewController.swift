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

  @IBAction private func triggerTimeIntervalNotification(_ sender: Any) {
  }
  
  
  @IBAction private func triggerCalendarNotification(_ sender: Any) {
  }
}

