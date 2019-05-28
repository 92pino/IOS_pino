//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

// CustomStringConvertible : 원하는 프로퍼티만 출력하길 원할 때 customStringConvertible 프로토콜 채택하고 description으로 반환

// CustomDebugStringConvertible :

class Dog: CustomStringConvertible, CustomDebugStringConvertible {
   
    // print를 찍을 경우 출력
    var description: String {
        return "Dog's name : \(name), age: \(age)"
    }
    
    // debugPrint를 찍을 경우 출력
    var debugDescription : String {
        return "Dog's name : \(name), age: \(age), feature: \(feature)"
    }
    
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
}

struct Cat: CustomStringConvertible, CustomDebugStringConvertible {
    
    // print를 찍을 경우 출력
    var description: String {
        return "Cat's name : \(name), age: \(age)"
    }
    
    var debugDescription: String {
        return "Cat's name : \(name), age: \(age), feature: \(feature)"
    }
    
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
}
