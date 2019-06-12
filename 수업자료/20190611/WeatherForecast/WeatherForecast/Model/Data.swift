//
//  Data.swift
//  WeatherForecast
//
//  Created by JinBae Jeong on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class CurrentLocation {
    
    static let shared: CurrentLocation = { return CurrentLocation() } ()
    
    var lat: Double = 0
    var lon: Double = 0
}

class CurrentTime {
    static let shared: CurrentTime = { return CurrentTime() } ()
    
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
        
        let hourly: [Hourly]
        struct Hourly: Codable {
            
            let grid: Grid
            let sky: Sky
            let temperature: Temperature
            struct Grid: Codable {
                let latitude, longitude, city, county, village: String
            }
            struct Sky: Codable {
                let code, name: String
            }
            
            struct Temperature: Codable {
                let tc, tmax, tmin: String
            }
        }
    }
    
    let weather: Weather
}
