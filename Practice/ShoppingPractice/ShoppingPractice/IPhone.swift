//
//  IPhone.swift
//  ShoppingPractice
//
//  Created by JinBae Jeong on 25/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

protocol ShoppingItem {
    var title: String { get }
    var imageName: String { get }
}

struct IPhone: ShoppingItem {
    let title: String
    let imageName: String
}
