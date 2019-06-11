//
//  WeatherHeaderTableViewCell.swift
//  WeatherForecast
//
//  Created by JinBae Jeong on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class WeatherHeaderTableViewCell: UITableViewCell {

    static let identifier = "DetailHeaderTableViewCell"
    
    let headerWeatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let headerWeatherName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        
        return label
    }()
    
    let headerWeatherMaxMinTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = .white
        
        return label
    }()
    
    let currentTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 130, weight: .ultraLight)
        label.textColor = .white
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func configure() {
        contentView.addSubview(headerWeatherImageView)
        contentView.addSubview(headerWeatherName)
        contentView.addSubview(headerWeatherMaxMinTemp)
        contentView.addSubview(currentTemp)
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            headerWeatherImageView.topAnchor.constraint(equalTo: headerWeatherMaxMinTemp.topAnchor, constant: -50),
            headerWeatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            headerWeatherImageView.widthAnchor.constraint(equalToConstant: 50),
            headerWeatherImageView.heightAnchor.constraint(equalToConstant: 50),

            headerWeatherName.topAnchor.constraint(equalTo: headerWeatherMaxMinTemp.topAnchor, constant: -50),
            headerWeatherName.heightAnchor.constraint(equalTo: headerWeatherImageView.heightAnchor),
            headerWeatherName.leadingAnchor.constraint(equalTo: headerWeatherImageView.trailingAnchor, constant: 10),
            headerWeatherName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            headerWeatherMaxMinTemp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            headerWeatherMaxMinTemp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerWeatherMaxMinTemp.topAnchor.constraint(equalTo: currentTemp.topAnchor, constant: -50),
            
            currentTemp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            currentTemp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -140),
            currentTemp.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            currentTemp.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}
