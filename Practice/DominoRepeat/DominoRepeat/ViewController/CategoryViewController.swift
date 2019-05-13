//
//  ViewController.swift
//  DominoRepeat
//
//  Created by JinBae Jeong on 13/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

  let headerView = UIImageView()
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
    configure()
    autoLayout()
  }
  
  private func configure() {
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
    tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
    headerView.image = UIImage(named: "logo")
    headerView.contentMode = .scaleAspectFit
    headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
    headerView.backgroundColor = .white
    
    tableView.tableHeaderView = headerView
    tableView.rowHeight = 100
    
  }
  
  private func autoLayout() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }


}

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuDatas.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
    
    cell.categoryImageView.image = UIImage(named: menuDatas[indexPath.row].category)
    cell.selectionStyle = .none
    
    return cell
  }
}

extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productListVC = ProductListViewController()
    productListVC.products = menuDatas[indexPath.row].products
    productListVC.title = menuDatas[indexPath.row].category
    show(productListVC, sender: nil)
  }
}
