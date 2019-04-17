//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  var tableView = UITableView()
  private var orderItems: [String: Int] = [:]
  let identifier = "cell"
  private let itemManager = Device()
  private lazy var items: [ShoppingItem] = itemManager.items
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addTableView()
  }
  
  func addTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.rowHeight = 60
    view.addSubview(tableView)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(items.count)
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//    var cellImage = UIImage(named: items[indexPath.row].imageName)
    cell.imageView?.image = UIImage(named: items[indexPath.row].imageName)
    cell.textLabel?.text = items[indexPath.row].title
    
    
    return cell
  }
}

