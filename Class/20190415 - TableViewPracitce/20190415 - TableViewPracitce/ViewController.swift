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
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.rowHeight = 60
    view.addSubview(tableView)
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    
  }
  
  @objc func didTapButton(_ sender: UIButton) {
    let cell = sender.superview?.superview as! CustomCell
    if let indexPath = tableView.indexPath(for: cell) {
      let addedNumber = data[indexPath.row] + 1
      data[indexPath.row] = addedNumber
      cell.textLabel?.text = "\(data[indexPath.row])"
    }
  }
  
  

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
    // 1) delegate
//    cell.delegate = self
//    cell.button.tag = indexPath.row
    
    // 2)
    if cell.textLabel?.text == nil {
      cell.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
  
  
  
}

extension ViewController: CustomCellDelegate {
  func customCell(_ customCell: CustomCell, didTapButton button: UIButton) {
//    let tag = button.tag
    if let indexPath = tableView.indexPath(for: customCell) {
      let addedNumer = data[indexPath.row] + 1
      data[indexPath.row] = addedNumer
      customCell.textLabel?.text = "\(addedNumer)"
    }
  }
}
