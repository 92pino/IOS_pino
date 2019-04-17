//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
  
  /***************************************************
   셀 스타일 4가지 (default, subtitle, value1, value2)
   1. basic
   2. right detail
   3. left detail
   4. subtitle
   ***************************************************/
  
  override var description: String {
    return "TableView - CellStyle"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 70
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }
  
  @objc func reloadData() {
//    tableView.refreshControl?.endRefreshing()
//    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(self)
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // 재사용
    let cell: UITableViewCell
      
    // 셀 최초 생성
    if indexPath.row.isMultiple(of: 4) {
      // 셀 재사용 시도 후 없으면 생성
      cell = UITableViewCell(style: .default, reuseIdentifier: "Default") ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
    } else if indexPath.row % 4 == 1 {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
    } else if indexPath.row % 4 == 2 {
      cell = UITableViewCell(style: .value1, reuseIdentifier: "Value1") ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
    } else {
      cell = UITableViewCell(style: .value2, reuseIdentifier: "Value2") ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")
    }
    
    // 공통 속성 세팅
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.detailTextLabel?.text = "ABCDEFGH"
    cell.imageView?.image = UIImage(named: "bear")
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
}

extension TableViewCellStyle: UITableViewDelegate {
  
}
