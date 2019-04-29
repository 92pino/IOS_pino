//
//  ViewController.swift
//  AutoLayout
//
//  Created by JinBae Jeong on 26/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var orangeView: UIView!
    
    var skyView: UIView = UIView()
    var navyView: UIView = UIView()
    var navyText: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        autoLayout()
    }
    
    func autoLayout(){
        view.addSubview(skyView)
        skyView.addSubview(navyView)
        skyView.addSubview(navyText)
        
        skyView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        skyView.translatesAutoresizingMaskIntoConstraints = false
        
        skyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        skyView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        skyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        skyView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        skyView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        skyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        navyView.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        navyView.translatesAutoresizingMaskIntoConstraints = false
        
        navyView.centerYAnchor.constraint(equalTo: skyView.centerYAnchor).isActive = true
        navyView.centerXAnchor.constraint(equalTo: skyView.centerXAnchor).isActive = true
        navyView.widthAnchor.constraint(equalTo: skyView.widthAnchor, multiplier: 0.5).isActive = true
        navyView.heightAnchor.constraint(equalTo: skyView.heightAnchor, multiplier: 0.5).isActive = true
        
        navyText.translatesAutoresizingMaskIntoConstraints = false
        navyText.text = "네번째 문제"
        navyText.font = UIFont.systemFont(ofSize: 23)
        navyText.backgroundColor = .white
        
        
        navyText.centerYAnchor.constraint(equalTo: navyView.centerYAnchor).isActive = true
        navyText.centerXAnchor.constraint(equalTo: navyView.centerXAnchor, constant: 20).isActive = true
        navyText.widthAnchor.constraint(greaterThanOrEqualTo: skyView.widthAnchor, multiplier: 0.7)
        
        
    }


}

