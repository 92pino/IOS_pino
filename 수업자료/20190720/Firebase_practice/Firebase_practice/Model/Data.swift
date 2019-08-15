//
//  Data.swift
//  Firebase_practice
//
//  Created by JinBae Jeong on 2019/07/20.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

// API URL: https://instagramcopy-be202.firebaseio.com/

struct CardData {
    var id: String
    var rank: String
    var name: String
    var imageUrl: String
    var imageOrientation: String
    
    enum CodingKeys: String, CodingKey {
        case id, rank, name
        case imageUrl = "image_url"
        case imageOrientation = "image_orientation"
    }
}
