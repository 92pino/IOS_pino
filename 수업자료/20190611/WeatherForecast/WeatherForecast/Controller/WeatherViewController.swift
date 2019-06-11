//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    // 현재위치
    var locationManager = CLLocationManager()
    
    let fakeNavi: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let fakeNaviTit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "도시명"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let fakeNaviSubTit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(CurrentTime.shared.nowTime())"
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let reloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let weatherTable: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        return tableView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunny")
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global().async {
            
            sleep(1)
            WeatherDataSource.shared.fetchSummary(lat: CurrentLocation.shared.lat, lon: CurrentLocation.shared.lon) {
                [weak self] in
                self?.weatherTable.reloadData()
            }
        }
    }
    
    private func configure() {
        view.addSubview(imageView)
        view.addSubview(weatherTable)
        view.addSubview(fakeNavi)
        fakeNavi.addSubview(fakeNaviTit)
        fakeNavi.addSubview(fakeNaviSubTit)
        fakeNavi.addSubview(reloadButton)
        
        weatherTable.dataSource = self
        weatherTable.delegate = self
        weatherTable.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        weatherTable.register(WeatherHeaderTableViewCell.self, forCellReuseIdentifier: WeatherHeaderTableViewCell.identifier)
        weatherTable.separatorStyle = .none
        weatherTable.allowsSelection = false
        getLocation()
        getLocation()
        autoLayout()
        
        reloadButton.addTarget(self, action: #selector(reloadData(_:)), for: .touchUpInside)
    }
    
    // 위도, 경도 받아오기
    private func getLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            fakeNavi.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            fakeNavi.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fakeNavi.heightAnchor.constraint(equalToConstant: 60),
            fakeNavi.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            fakeNaviTit.topAnchor.constraint(equalTo: fakeNavi.topAnchor),
            fakeNaviTit.centerXAnchor.constraint(equalTo: fakeNavi.centerXAnchor),
            fakeNaviTit.heightAnchor.constraint(equalToConstant: 20),
            fakeNaviTit.widthAnchor.constraint(equalToConstant: 150),
            
            fakeNaviSubTit.topAnchor.constraint(equalTo: fakeNaviTit.bottomAnchor),
            fakeNaviSubTit.centerXAnchor.constraint(equalTo: fakeNavi.centerXAnchor),
            fakeNaviSubTit.heightAnchor.constraint(equalToConstant: 20),
            fakeNaviSubTit.widthAnchor.constraint(equalToConstant: 200),
            
            reloadButton.topAnchor.constraint(equalTo: fakeNavi.topAnchor),
            reloadButton.trailingAnchor.constraint(equalTo: fakeNavi.trailingAnchor, constant: -20),
            
            weatherTable.topAnchor.constraint(equalTo: fakeNavi.bottomAnchor),
            weatherTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc private func reloadData(_ sender: UIButton) {
        print("reload")
    }

}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            default:
                return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = weatherTable.dequeueReusableCell(withIdentifier: WeatherHeaderTableViewCell.identifier, for: indexPath) as! WeatherHeaderTableViewCell
            if let data = WeatherDataSource.shared.summary?.weather.hourly.first {
                /*
                cell.headerCellWeatherImageView.image = UIImage(named: data.sky.code)
                cell.headerCellStatusLabel.text = data.sky.name
                
                let max = Double(data.temperature.tmax) ?? 0.0
                let min = Double(data.temperature.tmin) ?? 0.0
                
                let maxStr = tempFormatter.string(for: max) ?? "-"
                let minStr = tempFormatter.string(for: min) ?? "-"
                
                cell.headerCellMaxMintempLabel.text = "최대 \(maxStr)º 최소 \(minStr)º"
                
                let current = Double(data.temperature.tc) ?? 0.0
                let currentStr = tempFormatter.string(for: current) ?? "-"
                
                cell.headerCellThermometerLabel.text = "\(currentStr)º"
                */
                
                var skyCode = data.sky.code.dropFirst(5)
                cell.headerWeatherImageView.image = UIImage(named: "SKY_\(skyCode)")
                cell.headerWeatherName.text = data.sky.name
                cell.headerWeatherMaxMinTemp.text = "\(String(data.temperature.tmin) + "°" + "  " + String(data.temperature.tmax) + "°")"
                cell.currentTemp.text = "\(19.2)"
            }
            
            
            
            
            cell.backgroundColor = .clear
            
            return cell
        } else {
            let cell = weatherTable.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
            cell.backgroundColor = .clear
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.height
        } else {
            return 50
        }
    }
    
    
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coor = locationManager.location?.coordinate else { return }
        CurrentLocation.shared.lat = coor.latitude
        CurrentLocation.shared.lon = coor.longitude
    }
    
}
