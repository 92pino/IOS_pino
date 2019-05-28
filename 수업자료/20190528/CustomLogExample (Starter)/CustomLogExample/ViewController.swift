//
//  ViewController.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let dog = Dog()
  let cat = Cat()

  @IBAction private func didTapPrint(_ sender: Any) {
    print("\n---------- [ print ] ----------\n")
    print("Hello, world!")
    print(1...10)
    print(dog)
    print(cat)
    print(self)
    
    print("\n---------- [ debugPrint ] ----------\n")
    // 조금 더 명확한
    debugPrint("Hello, world!")
    debugPrint(1...10)
    debugPrint(dog)
    debugPrint(cat)
    debugPrint(self)
  
    // MARK: - dump
    print("\n---------- [ dump ] ----------\n")
    // 클래스 내 프로퍼티까지 확인할수 있는 로그
    dump("Hello, world!")
    dump(1...10)
    dump(dog)
    dump(cat)
    dump(self)
  }
  
    // Objective - C print법
    // 내부적으로 미리 로그를 찍은 시각이나 프로젝트에 대한 정보가 출력
  @IBAction private func didTapNSLog(_ sender: Any) {
    print("\n---------- [ NSLog ] ----------\n")
    NSLog("Hello, world!")
    NSLog("%@", self)
    
    // 클래스나 구조체에서 NSLog를 사용하고 싶을 경우 클래스 자체에 NSObject 채택
//    NSLog(%@, dog)
  }
  
    //
  @IBAction private func didTapSpecialLiterals(_ sender: Any) {
    print("\n---------- [ didTapSpecialLiterals ] ----------\n")
    
    print("file :", #file)
    print("function :", #function)
    print("line :", #line)
    print("column :", #column)
    
    print("\n---------- [ Example ] ----------\n")
    print("<\(#function) [\(#line)]> \(cat)")
  }
  
    
  @IBAction private func didTapCustomLog(_ sender: Any) {
    print("\n---------- [ Custom Log ] ----------\n")
  }
  
  @IBAction private func didTapTestButton(_ sender: Any) {
    print("\n---------- [ Test ] ----------\n")
    
    logger(cat)
    logger("world", header: "Dog!!")
  }
}



