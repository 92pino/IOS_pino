//
//  main.swift
//  visualBookManager
//
//  Created by JinBae Jeong on 29/11/2018.
//  Copyright © 2018 JinBae Jeong. All rights reserved.
//

import Foundation

print(myBookManager.showAllBooks())
print("number of books : \(myBookManager.countBooks())")

var searchResult = myBookManager.searchBook(name: "햄릿")

//        if searchResult != nil {
//            print("\(searchResult) 를 찾았습니다.")
//        } else {
//            print("찾으시는 책이 없습니다.")
//        }

if let searchResult = myBookManager.searchBook(name: "햄릿"){
    print("\(searchResult) 를 찾았습니다.")
} else {
    print("찾으시는 책이 없습니다.")
}

myBookManager.removeBook(name: "죄와벌")

print(myBookManager.showAllBooks())
print("number of books : \(myBookManager.countBooks())")
