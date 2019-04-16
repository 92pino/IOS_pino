//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
  
  /***************************************************
   테이블뷰 목록 수정하기 (insert, delete 등)
   ***************************************************/
  
  override var description: String {
    return "TableView - Editing"
  }
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  @objc func switchToEditing() {
    // 애니메이션 O
    tableView.setEditing(!tableView.isEditing, animated: true)
    // 애니메이션 X
    // tableView.isEditing.toggle()
    
    
    
  }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
  // 기본값 true
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // 원하는 인덱스가 있을 경우 아래처럼 처리
    if indexPath.row.isMultiple(of: 2) {
      return false
    } else {
      return true
    }
  }
  
  //
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .none:
      print("none")
    case .insert:
      
      data.insert((1...50).randomElement()!, at: indexPath.row)
//      data.insert(.random(in: 1...50), at: data.firstIndex(of: data[indexPath.row])!)
      tableView.insertRows(at: [indexPath], with: .automatic)
      
      
    case .delete:
      
      // 값을 먼저 delete 후 테이블뷰에 delete 요청
      
      data.remove(at: data.firstIndex(of: data[indexPath.row])!)
      //with: 애니메이션 효과
      tableView.deleteRows(at: [indexPath], with: .automatic)
      
      // swift5 문법 ==> none, delete, insert 외의 추가될수도 있을 경우 사용하는 문법
    @unknown default:
      print("Unknown case")
    }
  }
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    // 기본값
    // return .delete
    
    let row = indexPath.row
    if row.isMultiple(of: 3) {
      return .none
    } else if row % 3 == 1 {
      return .insert
    } else {
      return .delete
    }
    
  }
  
  /***********************************************************************
   iOS 11부터 가능
   ***********************************************************************/
  
  /*func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let addAction = UIContextualAction(style: .normal, title: "Add") {
      (action, sourceView, actionPerformed) in print("Add Action")
      actionPerformed(true)
    }
    addAction.backgroundColor = .green
//    return UISwipeActionsConfiguration(actions: [addAction])
    
    let configuration = UISwipeActionsConfiguration(actions: [addAction])
    configuration.performsFirstActionWithFullSwipe = true
    
    return configuration
  }*/
  
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
      (action, sourceView, actionPerformed) in print("delete Action")
      // 실제 데이터값 삭제
      self.data.remove(at: self.data.firstIndex(of: self.data[indexPath.row])!)
      actionPerformed(true)
    }
    deleteAction.backgroundColor = .brown
        return UISwipeActionsConfiguration(actions: [deleteAction])
    
  }
  
  /***********************************************************************
   iOS 8 ~ iOS 10
   ***********************************************************************/
  
  // trailingSwipeAction이 먼저 선언되어 있을 경우 editActionsForRowAt은 무시 (trailingSwipeAction가 먼저 실행)
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let addAction = UITableViewRowAction(style: .default, title: "Add") {
      (action, indexPath) in print("Add")
    }
    let editAction = UITableViewRowAction(style: .normal, title: "Edit") {
      (action, indexPath) in print("Edit")
    }
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {
      (action, indexPath) in print("Delete")
    }
    
    // 끝까지 스와이프 했을 경우 배열 제일 앞에 있는 동작으로 실행
    // 다음과 같은 경우 addAction 실행
    return [addAction, editAction, deleteAction]
  }
  
}

