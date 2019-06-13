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
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:00"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        addSubview(dateLabel)
    }
    
    private func addSubviews() {
        let views = [dateLabel]
        views.forEach { self.addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews()
        
        dateLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -3).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        /*
        time.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        time.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        sky.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sky.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 30).isActive = true
        sky.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        sky.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        temp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        temp.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
 */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
