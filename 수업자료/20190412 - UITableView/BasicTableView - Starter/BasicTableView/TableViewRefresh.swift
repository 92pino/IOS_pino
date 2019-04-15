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
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
  }
  
  @objc func reloadData() {
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    return cell
  }
}
