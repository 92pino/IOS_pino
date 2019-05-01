//
//  ViewController.swift
//  Notification_Homework
//
//  Created by JinBae Jeong on 30/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

extension FirstViewController {
    static var sliderNotification: Notification.Name {
        return Notification.Name("SliderNotification")
    }
}


class FirstViewController: UIViewController {
    
    @IBOutlet weak var red: UILabel!
    @IBOutlet weak var green: UILabel!
    @IBOutlet weak var blue: UILabel!
    @IBOutlet weak var alpha: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var btn: UIButton!
    
    var redValue:CGFloat = 0
    var greenValue:CGFloat = 0
    var blueValue:CGFloat = 0
    var alphaValue:CGFloat = 0
    
    var bgColor = UIColor()
    let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
      
        btn.addTarget(self, action: #selector(sendData)
            , for: .touchUpInside)
    }
  override func viewWillDisappear(_ animated: Bool) {

    sendData()

  }
  
    @objc func sendData(){
      print(1111)
        let name = Notification.Name("SliderNotification")
        let noti = Notification(name: name)
        notiCenter.post(name: name, object: nil, userInfo: ["red":redValue,"green":greenValue,"blue":blueValue,"alpha":alphaValue])
    }
    
    private func configure() {
        
        redSlider.tag = 0
        redSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        greenSlider.tag = 1
        greenSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        blueSlider.tag = 2
        blueSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        alphaSlider.tag = 3
        alphaSlider.addTarget(self, action: #selector(silderValueChanged), for: .valueChanged)
        
    }
    
    @objc func silderValueChanged(_ sender: UISlider) {
//        var redValue:CGFloat = 0
//        var greenValue:CGFloat = 0
//        var blueValue:CGFloat = 0
//        var alphaValue:CGFloat = 0
        
        switch sender.tag {
        case 0:
            redValue = CGFloat(sender.value)
            print(redValue)
        case 1:
            greenValue = CGFloat(sender.value)
            print(greenValue)
        case 2:
            blueValue = CGFloat(sender.value)
            print(blueValue)
        case 3:
            alphaValue = CGFloat(sender.value)
            print(alphaValue)
        default:
            break
        }
    }

}

