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
    // 자주하는 실수니 꼭 기억할것
    // dataSource, delegate
    tableView.dataSource = self
    view.addSubview(tableView)
    
    /***********************************************************************
     register - 재사용할 셀의 클래스를 미리 등록 가능
     새로운 아이디 -> 새로 등록
     같은 아이디 -> 이전에 등록한 클래스 업데이트
     ***********************************************************************/
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "CellId")
    
    // cellIdentifier가 다를 경우 런타임 오류
    // cellIdentifier 잘 보고 쓸것!
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoCellId")
    
  }
}

extension TableViewBasic: UITableViewDataSource {
    // 하나의 섹션에 몇개의 행을 구성할지 나타내는 내용
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1번 방식은 최대한 배제하고
        // 2번 방식은 : 코드
        // 3번 방식은 : 스토리보드, 코드
        // 최대한 3번 방식 이용
        
        // 1. 셀 생성
        // 메모리 낭비 심함
        
        /*
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        //indexPath ==> section과 row를 나타내는것
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        */
        
        // 2. 셀이 많을 경우를 대비해 셀의 재사용이 필요
        // 화면에서 사라질 셀을 새롭게 나타날 셀로 대체
        
        /*
        let cell: UITableViewCell
        // dequeueReusableCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellId") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        }
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        */
        
        // 3. register 메서드를 사용해 미리 셀을 등록 가능
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}



