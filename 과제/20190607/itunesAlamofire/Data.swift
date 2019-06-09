//
//  Data.swift
//  itunesAlamofire
//
//  Created by JinBae Jeong on 08/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

// MARK: - Musics
struct itunesSongs: Codable {
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let artistName: String?
    let trackName: String?
    let artworkUrl100: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, trackName, artworkUrl100
    }
}
