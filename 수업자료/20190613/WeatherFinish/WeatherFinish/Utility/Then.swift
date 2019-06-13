//
//  Then.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 13/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

public protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
    func then(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}
