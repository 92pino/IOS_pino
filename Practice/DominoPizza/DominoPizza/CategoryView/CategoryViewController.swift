//
//  CategoryViewController.swift
//  DominoPizza
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {

//    weak var delegate = CategoryViewControllerDelegate?
    
    var tableView = UITableView()
    let headerVIew = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeTableView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func makeTableView(){
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CellId")
        tableView.rowHeight = 100
        headerVIew.image = UIImage(named: "logo")
        headerVIew.contentMode = .scaleAspectFit
        headerVIew.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerVIew.backgroundColor = .white
        tableView.tableHeaderView = headerVIew
        
        view.addSubview(tableView)
    }
    
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.shared.logos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.imageView?.image = UIImage(named: Data.shared.logos[indexPath.row])
        return cell
    }
    
    
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pVC = ProductViewController()
        pVC.title = Data.shared.logos[indexPath.row]
//        pVC.menus = Data.shared.pizzas[indexPath.row].name
        navigationController?.pushViewController(pVC, animated: true)
    }
}
