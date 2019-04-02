//
//  ViewController.swift
//  Exam3
//
//  Created by JinBae Jeong on 29/03/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum MenuItem: Int {
        case 짜장면, 짬뽕, 탕수육
    }
    var 주문수량dict: [MenuItem: Int] = [
        MenuItem.짜장면: 0,
        MenuItem.짬뽕: 0,
        MenuItem.탕수육: 0
    ]
    let menuItemCostArr = [5_000, 6_000, 12_000]
    
    let 소지금금액Label = UILabel()
    var 소지금원본 = 70_000 {
        didSet {
            소지금금액Label.text = "\(소지금원본)원"
        }
    }
    
    let 결제금액토탈Label = UILabel()
    var 결제금액원본 = 0 {
        didSet {
            결제금액토탈Label.text = "\(결제금액원본)원"
        }
    }
    
    @IBOutlet weak var menu01LabelCount: UILabel!
    @IBOutlet weak var menu02LabelCount: UILabel!
    @IBOutlet weak var menu03LabelCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        소지금()
        결제금액()
        initializeData()
    }
    
    
    
    // 소지금 영역 메서드
    func 소지금() {
        let bottomView = UIView()
        
        bottomView.frame = CGRect(x: 0, y: 350, width: view.frame.width, height: 40)
        
        
        view.addSubview(bottomView)
        
        let 소지금Label = UILabel()
        let 초기화Button = UIButton(type: .system)
        
        소지금Label.text = "소지금"
        소지금Label.frame = CGRect(x: 20, y: 0, width: 80, height: 40)
        소지금Label.backgroundColor = #colorLiteral(red: 0.4257215315, green: 1, blue: 0.274916365, alpha: 1)
        소지금Label.textAlignment = .center
        
        소지금금액Label.frame = CGRect(x: 110, y: 0, width: 140, height: 40)
        소지금금액Label.backgroundColor = #colorLiteral(red: 0.4257215315, green: 1, blue: 0.274916365, alpha: 1)
        소지금금액Label.textAlignment = .right
        
        초기화Button.frame = CGRect(x: 270, y: 0, width: 80, height: 40)
        초기화Button.backgroundColor = .black
        초기화Button.setTitleColor(.white, for: .normal)
        초기화Button.setTitle("초기화", for: .normal)
        초기화Button.addTarget(self, action: #selector(initializeData), for: .touchUpInside)
        
        bottomView.addSubview(소지금Label)
        bottomView.addSubview(초기화Button)
        bottomView.addSubview(소지금금액Label)
        
        
    }
    
    
    // 결제금액 영역 메서드
    func 결제금액() {
        let bottomView = UIView()
        
        bottomView.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 40)
        
        
        view.addSubview(bottomView)
        
        let 결제금액Label = UILabel()
        let 결제Button = UIButton(type: .system)
        
        결제금액Label.text = "결제금액"
        결제금액Label.frame = CGRect(x: 20, y: 0, width: 80, height: 40)
        결제금액Label.backgroundColor = .orange
        결제금액Label.textAlignment = .center
        
        결제금액토탈Label.frame = CGRect(x: 110, y: 0, width: 140, height: 40)
        결제금액토탈Label.backgroundColor = .orange
        결제금액토탈Label.textAlignment = .right
        
        결제Button.frame = CGRect(x: 270, y: 0, width: 80, height: 40)
        결제Button.backgroundColor = .black
        결제Button.setTitleColor(.white, for: .normal)
        결제Button.setTitle("결제", for: .normal)
        결제Button.addTarget(self, action: #selector(didTapPaymentButton(_:)), for: .touchUpInside)
        
        bottomView.addSubview(결제금액Label)
        bottomView.addSubview(결제Button)
        bottomView.addSubview(결제금액토탈Label)
    }
    
    @IBAction func didTapOrderButton(_ sender: UIButton) {
        guard let item = MenuItem(rawValue: sender.tag), let amount = 주문수량dict[item] else { return }
        
        결제금액원본 += menuItemCostArr[sender.tag]
        주문수량dict[item] = amount + 1
        
        let labels = [menu01LabelCount, menu02LabelCount, menu03LabelCount]
        labels[sender.tag]?.text = "\(amount + 1)"
    }
    
    @objc func didTapPaymentButton(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "결제하기",
            message: "총 결제금액은 \(결제금액원본)원 입니다.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            guard self.소지금원본 >= self.결제금액원본 else { return print("소지금액이 부족합니다.") }
            let temp = self.소지금원본 - self.결제금액원본
            self.initializeData()
            self.소지금원본 = temp
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    @objc func initializeData() {
        소지금원본 = 70_000
        결제금액원본 = 0
        menu01LabelCount.text = "0"
        menu02LabelCount.text = "0"
        menu03LabelCount.text = "0"
        for key in 주문수량dict.keys {
            주문수량dict[key] = 0
        }
    }
    
}

