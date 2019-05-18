//
//  ViewController.swift
//  swiftAnimation
//
//  Created by JinBae Jeong on 14/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Time {
        static let short = 0.3
        static let middle = 0.65
        static let long = 1.0
    }
    
    private struct UI {
        static let menuCount = 5
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.3
    }
    
    let rightButton = ["버튼1", "버튼2", "버튼3", "버튼4", "버튼5", "버튼6"].compactMap { (title) -> UIButton in
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        
        return button
    }
    
    var openRight = true
    lazy var rightButtonPositionX = view.frame.width - 100
    var count = 0
    
    private var firstMenuContainer: [UIButton] = []
    private var rightMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
        rightButtonEvent()
    }
    
    private func randomColorGenerator() -> UIColor {
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        
        return button
    }
    
    private func setupFirstMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:))
                    , for: .touchUpInside)
            }
            
            view.bringSubviewToFront(firstMenuContainer.first!)
        }
    }
    
    private func rightButtonEvent() {
        rightButton.forEach {
            $0.tag = count
            $0.frame = CGRect(x: 50, y: view.frame.height - 120, width: 80, height: 80)
            $0.addTarget(self, action: #selector(clickRightButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc func firstMenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        UIView.animate(
            withDuration: Time.middle,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.0,
            options: [],
            animations: {
                for (idx, menu) in self.firstMenuContainer.enumerated() {
                    guard idx != 0 else { continue }
                    
                    if sender.isSelected {
                        menu.transform = .identity
                        menu.frame.origin.y -= UI.distance * CGFloat(idx)
                    } else {
                        menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                        menu.frame.origin.y += UI.distance * CGFloat(idx)
                    }
                }
        })
    }
    
    @objc func clickRightButton(_ sender: UIButton) {
        count = 0
        if openRight {
            UIView.animateKeyframes(
                withDuration: 2,
                delay: 0,
                options: [.beginFromCurrentState],
                animations: {
                    self.rightButton.forEach({ (button) -> () in
                        UIView.addKeyframe(
                            withRelativeStartTime: 0.25 * Double(button.tag),
                            relativeDuration: 0.25,
                            animations: {
                                for num in (self.count+1)..<self.rightButton.count {
                                    self.rightButton[num].center = CGPoint(x: self.view.frame.width - 100, y: button.center.y - 100)
                                }
                                button.transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                        self.count += 1
                    })
            })
        } else {
            
        }
    }
    
}
