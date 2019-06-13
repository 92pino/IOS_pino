//
//  StringExtensions.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 13/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

extension String {
    func size(with font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [.font : font])
    }
}
