//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!    
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView()
    }
    
    func setTable(){
        
    }
    
    func headerView() {
        let headerView = UIImageView()
        headerView.image = UIImage(named: "logo")
        headerView.contentMode = .scaleAspectFit
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerView.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Category")
        tableView.tableHeaderView = headerView
    }
    
    
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return category.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
//        cell
        
        return cell
    }
    
    
}
