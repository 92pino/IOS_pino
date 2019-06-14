//
//  WeatherCasterViewController.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 13/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import CoreLocation
import UIKit

final class WeatherCasterViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private let forecastService: ForecastServiceType = ForecastServiceStub()
    private let rootView = WeatherCasterView()
    
    private var lastRequestDate = Date(timeIntervalSinceNow: -10)
    private var now: String {
        get {
            let df = DateFormatter()
            df.locale = Locale(identifier: "ko")
            df.dateFormat = "a h:mm"
            return df.string(from: Date())
        }
    }
    
    // model
    private var currentForecast: CurrentForecast?
    private var shortRangeForecastList: [ShortRangeForecast]?
    
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestAuthorization()
    }
    
    // MARK: - Setup
    
    // 상태바 가려주는 기능
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func configureLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
    }
    
    private func configureViews() {
        rootView.reloadButton.addTarget(action: #selector(updateWeather(_:)))
    }
    
    private func requestAuthorization() {
        guard CLLocationManager.locationServicesEnabled() else {
            return presentAlert(message: "앱을 사용하기 위해서는 위치 권한이 필요합니다.")
        }
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse: break
        default:
            presentAlert(message: "앱을 사용하기 위해서는 위치 권한이 필요합니다.")
        }
    }
    
    
    // MARK: - Action Handler
    
    let imageName = ["sunny", "lightning", "cloudy", "rainy"]
    var count = 0
    @objc private func updateWeather(_ sender: UIButton) {
        // 위치정보랑 업데이트 시간 다시 표현(날씨정보 받아오기)
        locationManager.startUpdatingLocation()
        
        count += 1
        //날씨 상태를 참고해 그에 맞는 이미지를 뿌려줄 수도 있으나 여기서는 단순 교체
        //01:맑음, 02:구름조금, 03:구름많음, 04:구름많고 비, 05:구름많고 눈,
        //06:구름많고 비 또는 눈, 07:흐림, 08:흐리고 비, 09:흐리고 눈, 10:흐리고 비 또는 눈,
        //11:흐리고 낙뢰 12:뇌우/비, 13:뇌우/눈, 14:뇌우/비 또는 눈
        rootView.updateBackgroundImage(imageName: imageName[count % imageName.count])
        
        // 회전 애니메이션
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.duration = 0.5
        spinAnimation.toValue = CGFloat.pi * 2
        sender.layer.add(spinAnimation, forKey: "spinAnimation")
    }
    
    private func presentAlert(title: String = "알림", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(okAction)
        
        if presentedViewController == nil {
            present(alertController, animated: true)
        }
    }
}


// MARK: - CLLocationManagerDelegate

extension WeatherCasterViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        guard abs(location.timestamp.timeIntervalSinceNow) < 5 else { return }
        manager.stopUpdatingLocation()
        
        let currentDate = Date()
        if abs(lastRequestDate.timeIntervalSince(currentDate)) > 2 {
            reverseGeocoding(location: location)
            fetchCurrentForecast(lat: location.coordinate.latitude,
                                 lon: location.coordinate.longitude)
            fetchShortRangeForecast(lat: location.coordinate.latitude,
                                    lon: location.coordinate.longitude)
            lastRequestDate = currentDate
        }
    }
    
    private func reverseGeocoding(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let `self` = self else { return }
            guard error == nil else { return print(error!.localizedDescription) }
            guard let place = placemarks?.first else { return }
            
            let locality = place.locality ?? ""
            let subLocality = place.subLocality ?? ""
            let thoroughfare = place.thoroughfare ?? ""
            let address = locality + " " + (!subLocality.isEmpty ? subLocality : thoroughfare)
            
            DispatchQueue.main.async {
                if address.isEmpty {
                    self.presentAlert(message: "위치 조회 실패. 다시 시도해주세요.")
                } else {
                    self.rootView.updateTopInfoView(location: address, time: self.now)
                }
            }
        }
    }
    
    private func fetchCurrentForecast(lat: Double, lon: Double) {
        forecastService.fetchCurrentForecast(latitude: lat, longitude: lon) {
            [weak self] result in
            switch result {
            case .success(let currentForecast):
                self?.currentForecast = currentForecast
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchShortRangeForecast(lat: Double, lon: Double) {
        forecastService.fetchShortRangeForecast(latitude: lat, longitude: lon) {
            [weak self] result in
            switch result {
            case .success(let value):
                self?.shortRangeForecastList = value
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
