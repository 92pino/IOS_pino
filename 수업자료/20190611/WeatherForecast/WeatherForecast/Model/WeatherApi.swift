//
//  WeatherApi.swift
//  WeatherForecast
//
//  Created by JinBae Jeong on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class WeatherDataSource {
    static let shared = WeatherDataSource()
    
    private init() {}
    
    var summary: WeatherSummary?
    var forecastList = [Any]()
    lazy var grid = self.summary?.weather?.hourly?[0].grid
    
    // 실시간 날씨
    func fetchSummary(lat: Double, lon: Double, completion: @escaping () -> ()) {
        
        
        let apiUrl = "https://api2.sktelecom.com/weather/current/hourly?version=2&lat=\(lat)&lon=\(lon)&appKey=\(apiKey)"
        
        let url = URL(string: apiUrl)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print(httpResponse.statusCode)
                return
            }
            
            guard let data = data else {
                fatalError("Invalid Data")
            }
            
            if let weatherShort = try? decoder.decode(WeatherSummary.self, from: data) {
                WeatherDataSource.shared.summary = weatherShort
            }
            
        }
        
        task.resume()
        
    }
    
    // 단기 예보
    func fetchForecast(lat: Double, lon: Double, completion: @escaping () -> ()) {
        
        let apiUrl = "https://api2.sktelecom.com/weather/forecast/3days?version=2&lat=\(lat)&lon=\(lon)&appKey=\(apiKey)"
        let url = URL(string: apiUrl)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return print(error!) }
            guard let response = response as? HTTPURLResponse,
                200..<400 ~= response.statusCode else {return print("StatusCode is not valid")}
            guard let data = data,
                let jsonObject = try?
                    JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("No Data") }
            let weather = jsonObject["weather"] as? [String: Any]
            print(weather)
            let foreBefore = weather as? [String: Any]
            let foreAfter = foreBefore!["forecast3days"] as? [Any]
            let forecast3days = foreAfter![0] as? [String: Any]
//            print(forecast3days)
            let fcst3hour = forecast3days!["fcst3hour"] as? [String: Any]
            // 필요 온도값
            let temp = fcst3hour!["temperature"] as? [String: Any]
            // 필요 날씨
            let sky = fcst3hour!["sky"] as? [String: Any]
            sky?.forEach { print($0.value) }
            
            
        }.resume()
        
    }
}
