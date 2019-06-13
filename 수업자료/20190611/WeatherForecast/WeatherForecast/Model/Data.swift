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

class ResultData {
    static let shared = ResultData()
    
    var currentWeather: WeatherSummary? = nil
    var shortWeather: ShortForecast? = nil
    var skyHour = [String?]()
    var tempHour = [String?]()
    var firstTime: String? = nil
    
    func getGrid() -> Grid? {
        return (currentWeather?.weather?.hourly?[0].grid)
    }
    
    func getSky() -> ShortSky? {
        return (shortWeather?.shortWeather.forecast3Days[0].fcst3Hour.sky)
    }
    
    func getTemp() -> Temperature? {
        return (currentWeather?.weather?.hourly?[0].temperature)
    }
    
    func reset() {
        firstTime = nil
        currentWeather = nil
        skyHour = []
        tempHour = []
    }
    
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

// 단기예보
struct ShortForecast {
    let shortWeather: ShortWeather
}

// MARK: - Weather
struct ShortWeather {
    let forecast3Days: [Forecast3Day]
}

// MARK: - Forecast3Day
struct Forecast3Day {
    let timeRelease: String
    let fcst3Hour: Fcst3Hour
}

// MARK: - Fcst3Hour
struct Fcst3Hour {
    let sky: ShortSky
    let temperature: Fcst3HourTemperature
}

// MARK: - Sky
struct ShortSky {
    let code4Hour, name4Hour, code7Hour, name7Hour: String
    let code10Hour, name10Hour, code13Hour, name13Hour: String
    let code16Hour, name16Hour, code19Hour, name19Hour: String
    let code22Hour, name22Hour, code25Hour, name25Hour: String
    let code28Hour, name28Hour, code31Hour, name31Hour: String
    let code34Hour, name34Hour, code37Hour, name37Hour: String
    let code40Hour, name40Hour, code43Hour, name43Hour: String
    let code46Hour, name46Hour, code49Hour, name49Hour: String
    let code52Hour, name52Hour, code55Hour, name55Hour: String
    let code58Hour, name58Hour, code61Hour, name61Hour: String
    let code64Hour, name64Hour, code67Hour, name67Hour: String
}

// MARK: - Fcst3HourTemperature
struct Fcst3HourTemperature {
    let temp4Hour, temp7Hour, temp10Hour, temp13Hour: String
    let temp16Hour, temp19Hour, temp22Hour, temp25Hour: String
    let temp28Hour, temp31Hour, temp34Hour, temp37Hour: String
    let temp40Hour, temp43Hour, temp46Hour, temp49Hour: String
    let temp52Hour, temp55Hour, temp58Hour, temp61Hour: String
    let temp64Hour, temp67Hour: String
}
