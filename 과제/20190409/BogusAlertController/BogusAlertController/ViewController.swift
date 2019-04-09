//
//  ViewController.swift
//  BogusAlertController
//
//  Created by JinBae Jeong on 09/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let alertButton = UIButton(type: .system)
    var selectColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createAlertButton()
    }
    
    func createAlertButton() {
        let safeX = view.safeAreaInsets.left + view.safeAreaInsets.right
        let x = view.frame.width/2 - safeX
        let safeY = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let y = view.frame.height/2 - safeY
    
        alertButton.frame = CGRect(x: x - 100, y: y, width: 200, height: 80)
        alertButton.setTitle("Alert", for: .normal)
        alertButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        alertButton.setTitleColor(.white, for: .normal)
        
        alertButton.addTarget(self, action: #selector(goToSecondVC(_:)), for: .touchUpInside)
        
        view.addSubview(alertButton)
    }
    
    @objc func goToSecondVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        secondVC.delegate = self
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC, animated: true)
    }
}

extension ViewController: changeBackgroundColor {
    func sendColor(_ color: UIColor) {
        selectColor = color
        print(selectColor)
        view.backgroundColor = selectColor
    }
    
    
}
