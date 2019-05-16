//
//  Extensions.swift
//  slackCopy
//
//  Created by JinBae Jeong on 16/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
/*
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
*/
extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    
    // MARK: - AutoLayoutAnchor Helper
    var layout: UIView {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    @discardableResult
    func top(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.topAnchor
        topAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func leading(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.leadingAnchor
        leadingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func bottom(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.bottomAnchor
        bottomAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func trailing(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.trailingAnchor
        trailingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func centerY(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.centerYAnchor
        centerYAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func centerX(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.centerXAnchor
        centerXAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
}
