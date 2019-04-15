//
//  CustomCell.swift
//  20190415 - TableViewPracitce
//
//  Created by JinBae Jeong on 15/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

// final은 해당 클래스에 대해서는 상속을 하지 않겠다고 명시해주는
final class CustomCell: UITableViewCell {
  
  let button = UIButton(type: .system)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(button)
    button.setTitle("MyButton", for: .normal)
    button.backgroundColor = .yellow
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    button.frame = CGRect(x: frame.width - 120, y: 10, width: 80, height: frame.height - 20)
  }
  
  // 오토레이아웃
  override func updateConstraints() {
    super.updateConstraints()
  }
  
}
