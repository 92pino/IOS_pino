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
    var forecast: ShortForecast?
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
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            guard let weather = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let insideWeather = weather["weather"] as? [String: Any],
                let forecast3days = insideWeather["forecast3days"] as? [Any],
                let fcstBefore = forecast3days[0] as? [String: Any],
                let firstTime = fcstBefore["timeRelease"] as? String,
                let fcst = fcstBefore["fcst3hour"] as? [String: Any],
                let sky = fcst["sky"] as? [String: Any],
                let temp = fcst["temperature"] as? [String: Any]
                else { return }
            
            var hour = 4
            for _ in 0...18 {
                ResultData.shared.skyHour.append(sky["name\(hour)hour"] as? String)
                ResultData.shared.tempHour.append(temp["temp\(hour)hour"] as? String)
                hour += 3
            }
            ResultData.shared.firstTime = firstTime
            print(firstTime)
            completion()
        }.resume()
        
    }
}
