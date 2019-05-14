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
    
    private var firstMenuContainer: [UIButton] = []
    private var rightMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
        rightFistMenu()
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
    
    private func rightFistMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: view.bounds.width - 100, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            rightMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(secondMenuDidTap(_:))
                    , for: .touchUpInside)
            }
            
            view.bringSubviewToFront(rightMenuContainer.first!)
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
    
    @objc func secondMenuDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        UIView.animateKeyframes(
            withDuration: 0.8,
            delay: 0.0,
            options: [],
            animations: {
                if sender.isSelected {
                    for (idx, menu) in self.rightMenuContainer.enumerated() {
                        for i in (0..<self.rightMenuContainer.count).reversed() {
                            UIView.addKeyframe(
                                withRelativeStartTime: 0.0 + (0.1 * Double(idx)),
                                relativeDuration: 0.2,
                                animations: {
                                    menu.transform = .identity
                                    var index = idx - i
                                    
                                    if (idx - i) >= 0 {
                                        print(index)
                                        // self.rightMenuContainer[i].frame.origin.y -= UI.distance// * CGFloat(idx)
                                        menu.frame.origin.y -= UI.distance * CGFloat(i)
                                    }
                            })
                        }
                    }
                } else {
                    for (idx, menu) in self.rightMenuContainer.enumerated() {
                        UIView.addKeyframe(
                            withRelativeStartTime: 0.0 + (0.1 * Double(idx)),
                            relativeDuration: 0.2 + (0.2 * Double(idx)),
                            animations: {
                                menu.transform = .identity
                                menu.frame.origin.y += UI.distance * CGFloat(idx)
                        })
                    }
                }
        })
    }
}
