//
//  CustomView.swift
//  DelegateExample
//
//  Created by JinBae Jeong on 23/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

final class CustomView: UIView {
    weak var delegate: CustomViewDelegate?

    override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            let color = delegate?.colorForBackground(newValue)
            
            // 커스터마이징 포인트 : 새로 들어온 color를 받아서 color를 리턴
            // 커스터마이징 불가능 포인트 : 그 외 전부
            
            let newColor = color ?? newValue ?? .gray
            super.backgroundColor = newColor
            
            print("새로 변경될 색은 :", backgroundColor!)
        }
    }

}
