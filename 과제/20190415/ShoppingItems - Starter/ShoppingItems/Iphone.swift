//
//  Iphone.swift
//  ShoppingItems
//
//  Created by JinBae Jeong on 16/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.//

import Foundation

protocol ShoppingItem {
  var title: String { get }
  var imageName: String { get }
}

struct IPhone: ShoppingItem {
  let title: String
  let imageName: String
}
