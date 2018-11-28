//
//  BookManager.swift
//  BookManager
//
//  Created by JinBae Jeong on 28/11/2018.
//  Copyright © 2018 JinBae Jeong. All rights reserved.
//

import Foundation

class BookManager {
    var bookList = [Book]()
    
    // 책 등록
    func registerBook(bookObject:Book) {
        bookList += [bookObject]
    }
    
    // 전체 책 리스트 show
    func showAllBooks() -> String {
        
        var strTemp = ""
        for bookTemp in bookList {
            strTemp += "Name : \(bookTemp.name)\n"
            strTemp += "Genre : \(bookTemp.genre)\n"
            strTemp += "Author : \(bookTemp.author)\n"
            strTemp += "-------------------\n"
        }
        
        return strTemp
        
    }
    
    // 책 갯수 return
//    func countBooks() -> Int {
//
//    }
    
    // 책 검색
//    func searchBook(name:String) -> String?{
//
//    }
    
    // 책 삭제
//    func removeBook(name:String){
//
//    }
}
