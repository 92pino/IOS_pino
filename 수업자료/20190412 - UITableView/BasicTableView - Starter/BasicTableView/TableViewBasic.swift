//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String {
    return "TableView - Basic"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
  }
}

extension TableViewBasic {
}



