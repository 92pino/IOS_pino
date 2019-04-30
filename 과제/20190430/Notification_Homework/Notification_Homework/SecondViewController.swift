//
//  SecondViewController.swift
//  Notification_Homework
//
//  Created by JinBae Jeong on 30/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let bg = UIView()
    let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notiCenter.addObserver(self, selector: #selector(sliderNotification(sender:)), name: Notification.Name("SliderNotification"), object: nil)
    
        autoLayout()
        // Do any additional setup after loading the view.
    }
    
    func autoLayout(){
        
        view.addSubview(bg)
        bg.translatesAutoresizingMaskIntoConstraints = false
//        bg.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        
        bg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func sliderNotification(sender: Notification) {
        print("hi")
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        guard let userInfo = sender.userInfo as? [String:CGFloat] else { return }
        
        red = userInfo["red"]!
        green = userInfo["green"]!
        blue = userInfo["blue"]!
        alpha = userInfo["alpha"]!
        
        
        bg.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func removeNotificationObserver(){
        notiCenter.removeObserver(self)
    }
    
    deinit {
        removeNotificationObserver()
    }

}
