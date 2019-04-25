//
//  TableView03.swift
//  BasicTableView
//
//  Created by 이봉원 on 08/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
  
  /***************************************************
   테이블뷰를 새로 불러올 때마다 숫자 목록을 반대로 뒤집어서 출력하기
   ***************************************************/
  
  override var description: String {
    return "TableView - Refresh"
  }
  
  let tableView = UITableView()
  var data = Array(1...40)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
        title: "Refresh", style: .plain, target: self, action: #selector(reloadData)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    tableView.rowHeight = 60
    
    // pull to Refresh
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(reloadData)
        , for: .valueChanged)
    // refreshControl 색상 변경
    refreshControl.tintColor = .blue
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    data.reverse()
    // reverse를 몰랐을 경우 for문 이용
    
    // reload가 끝났을 경우
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}
