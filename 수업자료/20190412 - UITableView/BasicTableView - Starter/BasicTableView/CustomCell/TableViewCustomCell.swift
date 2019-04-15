//
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by 이봉원 on 11/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
  
  /***************************************************
   커스텀 셀 사용하기
   ***************************************************/
  
  override var description: String {
    return "TableView - CustomCell"
  }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 80
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
  }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(self)
    return 20
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // 공통적으로 묶을 수 있는 부모 클래스 UITableViewCell 타입
    // CustomCell, UITableViewCell
    let cell:UITableViewCell
    
    // 어떤 조건에서 어떤 셀을 사용할 것인지 결정
    
    /*
    if let defaultCell = tableView.dequeueReusableCell(withIdentifier: "Default") {
      cell = defaultCell
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "Custom")!
      cell.backgroundColor = .green
    }
     */
    
    if indexPath.row.isMultiple(of: 2) {
      cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
      
      let customCell = cell as! CustomCell
      customCell.myLabel.text = "ABCDEFGH"
      customCell.myLabel.textColor = .black
      customCell.myLabel.backgroundColor = .yellow
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
    }
    
    
    cell.textLabel?.text = "\(indexPath.row * 1000)"
    cell.imageView?.image = UIImage(named: "bear")
    
    /***********************************************************************
     
     cellForRowAt 메서드에서는 아직 cell의 frame이 제대로 설정되어 있지 않음.
     ## layout이 제대로 안 잡혀 있는 단계 ##
     
    ***********************************************************************/
    
    // defaultCell이 포함되어 있을수도 있으므로 as에 !가 아니라 ?로 작성
//    (cell as? CustomCell)?.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
    
    return cell
    
//    return UITableViewCell(style: .default, reuseIdentifier: "CellId")
  }
}


// MARK: - UITableViewDelegate

extension TableViewCustomCell: UITableViewDelegate {
  // 실제로 UI시점 잡는 지점
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//    guard let customCell = cell as? CustomCell else { return }
//    customCell.myLabel.frame = CGRect(x: cell.frame.width - 120, y: 15, width: 100, height: cell.frame.height - 30)
    
    print("layoutSubviews")
  }
}

