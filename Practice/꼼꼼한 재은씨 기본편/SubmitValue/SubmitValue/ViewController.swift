//
//  ViewController.swift
//  SubmitValue
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 이메일 주소를 입력받는 텍스트필드
    @IBOutlet weak var email: UITextField!
    // 자동 갱신 여부를 설정하는 스위치
    @IBOutlet weak var isUpdate: UISwitch!
    //갱신 주기를 설정하는 스테퍼
    @IBOutlet weak var interval: UIStepper!
    
    // 자동갱신 여부를 표시하는 레이블
    @IBOutlet weak var isUpdateText: UILabel!
    // 갱신주기를 텍스트로 표시하는 레이블
    @IBOutlet weak var intervalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        
        // 값을 전달하는 과정을 여기에 작성
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else { return }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    
}

