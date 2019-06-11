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
}
