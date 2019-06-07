//
//  ViewController.swift
//  itunesAlamofire
//
//  Created by JinBae Jeong on 07/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view .addSubview(tableView)
        configure()
    }
    
    func configure() {
        tableView.dataSource = self
    }


}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunes", for: indexPath)
        cell.imageView?.image = UIImage(named: "pino")
        
        return cell
    }
    
    
}
