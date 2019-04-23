//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2018. 10. 3..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private struct Key {
        static let today = "Today"
        static let alarmOn = "AlarmOn"
    }

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(datePicker.date, forKey: Key.today)
    userDefaults.set(alertSwitch.isOn, forKey: Key.alarmOn)
    
    print(userDefaults)
  }
  
  @IBAction func loadData(_ button: UIButton) {
    let userDefaults = UserDefaults.standard
    let today = (userDefaults.object(forKey: Key.today) as? Date) ?? Date()
    let alarmOn = userDefaults.bool(forKey: Key.alarmOn)
    
    print(today)
    print(alarmOn)
    
    datePicker.setDate(today as! Date, animated: true)
    alertSwitch.setOn(alarmOn, animated: true)
  }
}

