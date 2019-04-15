//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    tableView.dataSource = self
//    tableView.rowHeight = 60
//    view.addSubview(tableView)
//    tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
    
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
    return cell
  }
}

