//
//  CodeSpotInfoViewController.swift
//  VacationSpots
//
//  Created by Wi on 29/05/2019.
//  Copyright © 2019 Jawwad Ahmad. All rights reserved.
//

import UIKit

class CodeSpotInfoViewController: UIViewController {
    
    var vacationSpot: VacationSpot!
    
    let scrollVC = UIScrollView()
//    let totalSV = UIStackView()
    
    let whyVisit: UILabel = {
        let label = UILabel()
        label.text = "WHY VISIT"
        
        return label
    }()
    
    let whyVisitLabel: UILabel = {
        let label = UILabel()
        label.text = "whyVisitLabel"
        label.numberOfLines = 0
        
        return label
    }()
    
    let weather: UILabel = {
        let label = UILabel()
        label.text = "WEATHER"
        
        return label
    }()
    
    let weatherInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "whatToSeeLabel"
        label.numberOfLines = 0
        
        return label
    }()
    
    let wts: UILabel = {
        let label = UILabel()
        label.text = "What To See"
        
        return label
    }()
    
    let wtsLabel: UILabel = {
        let label = UILabel()
        label.text = "What to see label"
        label.numberOfLines = 0
        
        return label
    }()
    
    let rating: UILabel = {
        let label = UILabel()
        label.text = "RATING"
        
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★★"
        
        return label
    }()
    
    let submitRating: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit Rating", for: .normal)
        
        return button
    }()
    
    let viewMap: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View Map", for: .normal)
        
        return button
    }()
    
    let Wikipedia: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Wikipedia", for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        print(vacationSpot)
        
        
        whyVisitLabel.text = vacationSpot.whyVisit
        weatherInfoLabel.text = vacationSpot.whatToSee
        wtsLabel.text = vacationSpot.weatherInfo
        ratingLabel.text = String(repeating: "★", count: vacationSpot.userRating)

    }
    
    func configure() {
        // let stackvc = UIStackView(arrangedSubviews: [whyVisitSV])
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(scrollVC)
    
        
        
        let whyVisitSV = UIStackView(arrangedSubviews: [whyVisit,whyVisitLabel])
        whyVisitSV.axis = .vertical
        whyVisitSV.alignment = .fill
        whyVisitSV.distribution = .fill
        whyVisitSV.spacing = 0
        
        let weatherSV = UIStackView(arrangedSubviews: [weather,weatherInfoLabel])
        weatherSV.axis = .vertical
        weatherSV.alignment = .leading
        weatherSV.distribution = .fill
        weatherSV.spacing = 0
        
        let wtsSV = UIStackView(arrangedSubviews: [wts,wtsLabel])
        wtsSV.axis = .vertical
        wtsSV.alignment = .fill
        wtsSV.distribution = .fill
        wtsSV.spacing = 0
        
        let ratingSV = UIStackView(arrangedSubviews: [rating,ratingLabel])
        ratingSV.axis = .horizontal
        ratingSV.alignment = .fill
        ratingSV.distribution = .fillEqually
        ratingSV.spacing = 8
        
        let buttonSV = UIStackView(arrangedSubviews: [submitRating,viewMap,Wikipedia])
        buttonSV.axis = .horizontal
        buttonSV.alignment = .fill
        buttonSV.distribution = .equalSpacing
        buttonSV.spacing = 8
        
        let totalSV = UIStackView(arrangedSubviews: [whyVisitSV, weatherSV, wtsSV, ratingSV, buttonSV])
        totalSV.axis = .vertical
        totalSV.alignment = .fill
        totalSV.distribution = .fill
        totalSV.spacing = 20
        
        scrollVC.addSubview(totalSV)
        autoLayout()
        totalSV.translatesAutoresizingMaskIntoConstraints = false
        totalSV.topAnchor.constraint(equalTo: scrollVC.topAnchor).isActive = true
        totalSV.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        totalSV.bottomAnchor.constraint(equalTo: scrollVC.bottomAnchor).isActive = true
        totalSV.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        scrollVC.translatesAutoresizingMaskIntoConstraints = false
        scrollVC.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollVC.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        scrollVC.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollVC.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
    }

}
