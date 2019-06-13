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

class currentCity {
    static let shared: CurrentLocation = { return CurrentLocation() } ()
    
    
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
// MARK: - Weather
struct WeatherSummary: Codable {
    let weather: Weather?
}

// MARK: - WeatherClass
struct Weather: Codable {
    let hourly: [Hourly]?
}

// MARK: - Hourly
struct Hourly: Codable {
    let grid: Grid?
    let sky: Sky?
    var temperature: Temperature?
}

// MARK: - Grid
struct Grid: Codable {
    let city, county, village: String?
}

// MARK: - Sky
struct Sky: Codable {
    let code: String?
    let name: String?
}

// MARK: - Temperature
struct Temperature: Codable {
    var tc: String?
    var tmax: String?
    var tmin: String?
}
