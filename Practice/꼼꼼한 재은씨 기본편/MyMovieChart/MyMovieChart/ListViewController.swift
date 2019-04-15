//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 15/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
  // MARK: - 데이터 리펙토링 소스
  var dataset = [
    ("다크 나이트","영웅물에 철학에 음악까지 더해져 예술이 되다.","2009-09-04", 8.95),
    ("호우시절","때를 알고 내리는 좋은 비","2009-10-08", 7.31),
    ("말할 수 없는 비밀","여기서 너까지 다섯 걸음","2015-05-07", 9.19)
  ]
  
  // 테이블 뷰를 구성할 리스트 데이터
  lazy var list: [MovieVO] = {
    var datalist = [MovieVO]()
    for (title, desc, opendate, rating) in self.dataset {
      let mvo = MovieVO()
      mvo.title = title
      mvo.description = desc
      mvo.opendate = opendate
      mvo.rating = rating
      
      datalist.append(mvo)
    }
    
    return datalist
  }()
  
  // 뷰컨트롤러가 초기화되면서 뷰가 메모리에 로딩될 때 호출되는 메소드
  // 처음 한 번만 실행되는 로직
  override func viewDidLoad() {
    // MARK: - 데이터 기존 소스
    /*
    // 첫번째 행
    var mvo = MovieVO()
    mvo.title = "다크나이트"
    mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다."
    mvo.opendate = "2009-09-04"
    mvo.rating = 8.95
    // 배열에 추가
    self.list.append(mvo)
    
    // 두번째 행
    mvo = MovieVO()
    
    mvo.title = "호우시절"
    mvo.description = "때를 알고 내리는 좋은 비"
    mvo.opendate = "2009-10-08"
    mvo.rating = 7.31
    // 배열에 추가
    self.list.append(mvo)
    
    // 세번째 행
    mvo = MovieVO()
    
    mvo.title = "말할 수 없는 비밀"
    mvo.description = "여기서 너까지 다섯 걸음"
    mvo.opendate = "2015-05-07"
    mvo.rating = 9.19
    // 배열에 추가
    self.list.append(mvo)*/
    
  }
  
  // 테이블 뷰가 생성해야 할 행의 개수를 반환
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.list.count
  }
  
  // 각 행이 화면에 표현해야 할 내용을 구성하는 데에 사용 (하나하나의 개별적인 테이블 셀 객체)
  // numberOfRowsInSection가 반환하는 값만큼 메소드가 반복 호출됨
  // indexPath -> tableView의 행을 식별하는 인덱스 경로
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 주어진 행에 맞는 데이터 소스를 읽어온다.
    // indexPath.row -> section N번째에 있는 row
    let row = self.list[indexPath.row]
    
    // dequeueReusableCell(withIdentifier:) 메소드는 UITableViewCell 타입으로 셀을 반환
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
    
    // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
    cell.title?.text = row.title
    cell.desc?.text = row.description
    cell.opendate?.text = row.opendate
    cell.rating?.text = "\(row.rating!)"
    
    // 구성된 셀을 반환함
    return cell
  }
  
  // 테이블 셀을 클릭하거나 터치했을 때 액션처리
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
  }
}
