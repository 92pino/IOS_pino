//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by JinBae Jeong on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    static let identifier = "DetailTableViewCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        
        return label
    }()
    
    let temp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50, weight: .light)
        label.textColor = .white
        return label
    }()
    
    let sky: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        addSubview(dateLabel)
        addSubview(timeLabel)
        addSubview(temp)
        addSubview(sky)
    }
    
    private func addSubviews() {
        let views = [dateLabel, timeLabel, temp, sky]
        views.forEach { self.addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews()
        
        dateLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -3).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true

        sky.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sky.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 30).isActive = true
        sky.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        sky.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true

        temp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        temp.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
