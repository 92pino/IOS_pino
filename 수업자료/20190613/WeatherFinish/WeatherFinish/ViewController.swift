//
//  ViewController.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 13/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: ExampleTableViewCell.reuseIdentifier)
        tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCell.reuseIdentifier)
        */
        
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: ExampleTableViewCell.identifier)
        
        tableView.register(cell: ExampleTableViewCell.self)
    }

    
    
}

