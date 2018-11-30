//
//  Book.swift
//  BookManager
//
//  Created by JinBae Jeong on 28/11/2018.
//  Copyright © 2018 JinBae Jeong. All rights reserved.
//

import Foundation

struct Book {
    var name: String?
    var genre:String?
    var author:String?
    
    func bookPrint(){
        print("Name : \(name)")
        print("genre : \(genre)")
        print("author : \(author)")
        print("--------------------")
    }
}
