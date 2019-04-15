//
//  ViewController.swift
//  20190415 - TableViewPracitce
//
//  Created by JinBae Jeong on 15/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  let tableView = UITableView()
  let data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.rowHeight = 60
    view.addSubview(tableView)
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CellId")
    // Do any additional setup after loading the view.
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
  
}
