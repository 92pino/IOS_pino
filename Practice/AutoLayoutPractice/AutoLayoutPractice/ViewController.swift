//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by JinBae Jeong on 25/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let view01 = UILabel()
    let view02 = UILabel()
    let view03 = UILabel()
    let view04 = UILabel()
    let view05 = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        autoLayout()
    }
    
    func autoLayout(){
        var guide = view.safeAreaLayoutGuide
        
        view.addSubview(view01)
        view.addSubview(view02)
        view.addSubview(view03)
        view.addSubview(view04)
        view.addSubview(view05)
        view01.addSubview(button)
        
        view01.translatesAutoresizingMaskIntoConstraints = false
        view01.backgroundColor = .red
        
        view01.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view01.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        view01.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
       
        
        
        view02.translatesAutoresizingMaskIntoConstraints = false
        view02.backgroundColor = .blue
        
        view02.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view02.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        view02.widthAnchor.constraint(equalTo: view01.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        view02.trailingAnchor.constraint(equalTo: view01.leadingAnchor, constant: -8).isActive = true
        
        
        view03.translatesAutoresizingMaskIntoConstraints = false
        view03.backgroundColor = .orange
        
        view03.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view03.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        view03.widthAnchor.constraint(equalTo: view02.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        view03.trailingAnchor.constraint(equalTo: view02.leadingAnchor, constant: -8).isActive = true
        
        
        view04.translatesAutoresizingMaskIntoConstraints = false
        view04.backgroundColor = .green
        
        view04.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view04.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        view04.widthAnchor.constraint(equalTo: view03.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        view04.trailingAnchor.constraint(equalTo: view03.leadingAnchor, constant: -8).isActive = true
        
        
        view05.translatesAutoresizingMaskIntoConstraints = false
        view05.backgroundColor = .purple
        
        view05.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view05.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        view05.widthAnchor.constraint(equalTo: view04.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        view05.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        view05.trailingAnchor.constraint(equalTo: view04.leadingAnchor, constant: -8).isActive = true
        
    }


}

