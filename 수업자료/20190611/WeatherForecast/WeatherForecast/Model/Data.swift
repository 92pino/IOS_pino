//
//  Data.swift
//  WeatherForecast
//
//  Created by JinBae Jeong on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CurrentLocation {
    static let shared = CurrentLocation()
    
    private init(){}
    
    var lat: String = ""
    var lon: String = ""
}

class CurrentTime {
    static let shared = CurrentTime()
    
    private init(){}
    
    private var now: Date {
        return Date()
    }
    
    private let date = DateFormatter()
    
    func nowTime() -> String {
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST")
        date.dateFormat = "a hh:mm"
        
        return date.string(from: now)
    }
}

//실시간

struct WeatherSummary: Codable {
    struct Weather: Codable {
        struct Minutely: Codable {
            struct Grid: Codable {
                let latitude, longitude, city, county, village: String
            }
            struct Sky: Codable {
                let code, name: String
            }
            
            struct Temperature: Codable {
                let tc, tmax, tmin: String
            }
            
            let sky: Sky
            let temperature: Temperature
        }
        
        let minutely: [Minutely]
    }
    
    struct Result: Codable {
        let code: Int
        let message: String
    }
    
    let weather: Weather
    let result: Result
}
