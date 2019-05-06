//
//  TableViewNumbers.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewNumbers: UIViewController {
  
  /***************************************************
   1부터 50까지의 숫자 출력하기
   ***************************************************/
  
  var arr = Array(1...50)
  
  override var description: String {
    return "Practice 1 - Numbers"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
}

extension TableViewNumbers: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "\(arr[indexPath.row])"
    return cell
  }
  
  
}
