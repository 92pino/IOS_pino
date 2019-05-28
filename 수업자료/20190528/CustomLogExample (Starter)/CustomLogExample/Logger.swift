//
//  Logger.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

// custom log 생성
func logger(
    _ contents: Any...,
    header: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
    ) {
    
    let emoji = "🏴‍☠️"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SS"
    let timestamp = dateFormatter.string(from: Date())
    
    let fileUrl = URL(fileURLWithPath: file)
    // deletingPathExtension : 확장자 삭제(ex -> .swift)
    // lastPathComponent : 파일 경로에서 가장 마지막 컴포넌트
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    
    let header = header.isEmpty ? "" : " [ \(header) ] -"
    
    let content = contents.reduce("") {
        $0 + " " + String(describing: $1)
    }
    
    print("\(emoji) \(file) / \(function) / (\(line)) / \(header)\(contents)")
    print("\(emoji) \(fileName) / \(function) / (\(line)) / \(emoji)  \(header)\(contents)")
    
    print("현재 시간 : \(timestamp)")
}
