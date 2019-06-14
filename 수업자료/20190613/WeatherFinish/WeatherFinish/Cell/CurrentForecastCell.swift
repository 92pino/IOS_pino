//
//  CurrentForecastCell.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 14/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

final class CurrentForecastCell: UITableViewCell {
    
    private enum UI {
        static let xPadding: CGFloat = 10
        static let yPadding: CGFloat = 6
        static let leftMargin: CGFloat = 16
        static let topMargin: CGFloat = 16
        
        static let weatherImageSize: CGFloat = 40
    }
    
    // MARK: - Properties
    
    private let weatherImageView = UIImageView().then {
        $0.frame = CGRect.make(
            UI.leftMargin, UI.topMargin, UI.weatherImageSize, UI.weatherImageSize
        )
        $0.contentMode = .scaleAspectFit
    }
    private let statusLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .light)
    }
    private let tempMinMaxLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 22, weight: .light)
    }
    private let currentTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 120, weight: .ultraLight)
    }
    
    // MARK: - Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubviews(
            weatherImageView, statusLabel, tempMinMaxLabel, currentTempLabel
        )
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 값이 모두 정해져있을 경우 init 메서드 내에서 레이아웃 설정 가능
    func setupLayout() {
        statusLabel.width = .screenWidth
//        ("1" as NSString).size(withAttributes: [NSAttributedString.Key.font : statusLabel.font!]
        statusLabel.height = "아무문자나 상관없음".size(with: statusLabel.font!).height
        statusLabel.x = weatherImageView.maxX + UI.xPadding
        statusLabel.y = weatherImageView.maxY - statusLabel.height
        
        tempMinMaxLabel.x = weatherImageView.x + UI.xPadding
        tempMinMaxLabel.y = weatherImageView.maxY + UI.yPadding
        tempMinMaxLabel.width = .screenWidth
        tempMinMaxLabel.height = "아무문자나 상관없음".size(with: tempMinMaxLabel.font!).height
        
        currentTempLabel.x = tempMinMaxLabel.x
        currentTempLabel.y = tempMinMaxLabel.maxY - UI.yPadding
        currentTempLabel.width = .screenWidth
        currentTempLabel.height = "아무문자나 상관없음".size(with: currentTempLabel.font!).height
    }
    
    // MARK: - Setup Cell Data
    
    func configureCell(
        weatherImageName: String,
        weatherStatus: String,
        minMaxTemp: String,
        currentTemp: String
        ) {
        weatherImageView.image = UIImage(named: weatherImageName)
        statusLabel.text = weatherStatus
        tempMinMaxLabel.text = minMaxTemp
        currentTempLabel.text = currentTemp
    }
}
