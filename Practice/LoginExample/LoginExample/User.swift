//
//  User.swift
//  LoginExample
//
//  Created by JinBae Jeong on 05/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

class User {
    let name: String
    let profileImageName: String
    let password: String
    
    init(name: String, profileImageName: String, password: String) {
        self.name = name
        self.profileImageName = profileImageName
        self.password = password
    }
}
