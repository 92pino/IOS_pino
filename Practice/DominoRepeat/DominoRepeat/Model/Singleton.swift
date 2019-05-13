//
//  Singleton.swift
//  DominoRepeat
//
//  Created by JinBae Jeong on 13/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var wishListDict: [String: Int] = [:]
}
