//
//  ViewController.swift
//  TableViewSection
//
//  Created by JinBae Jeong on 01/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    configure()
    autoLayout()
  }
  
  func configure() {
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func autoLayout(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }


}

extension FirstViewController: UITableViewDataSource {
  // 섹션의 개수
  // 설정 안할 경우 0개
  func numberOfSections(in tableView: UITableView) -> Int {
    return menuDatas.count
  }
  
  // 행의 개수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuDatas[section].products.count
  }
  
  // 섹션 명
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return menuDatas[section].category
  }
  
  // 행의 텍스트 가져오기
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "\(menuDatas[indexPath.section].products[indexPath.row].name)"
    return cell
  }
  
  
}
