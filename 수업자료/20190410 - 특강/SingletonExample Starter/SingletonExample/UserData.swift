//
//  UserData.swift
//  SingletonExample
//
//  Created by JinBae Jeong on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

class UserData {
    static let singleton = UserData()
    
    var userName: String? = ""
    var password: String? = ""
    var age: String? = ""
    var phone: String? = ""
    
    private init() {
        
    }
}
