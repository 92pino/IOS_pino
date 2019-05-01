//
//  SecondViewController.swift
//  Notification_Homework2
//
//  Created by JinBae Jeong on 30/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let resultLabel = UILabel()
    let notiCenter = NotificationCenter.default
    
    override func viewWillAppear(_ animated: Bool) {
        
        resultLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(resultLabel)
    }
  
  
    // MARK: - addObserver
    func set(){
        notiCenter.addObserver(self, selector: #selector(changeLabel), name: Notification.Name("sendTextField"), object: nil)
    }
    
    @objc func changeLabel(sender: Notification){
        guard let userInfo = sender.userInfo as? [String:String] else { return }
        var lb = userInfo["txt"]!
        
        resultLabel.text = lb
    }
    // TODO: - 할일
    func todo(){
      
    }
  
    // FIXME: - 고쳐야 할 것
    func fixme(){
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func removeNotificationObserver() {
        
        notiCenter.removeObserver(self)
        
    }
    
    
    deinit {
        removeNotificationObserver()
    }

}
