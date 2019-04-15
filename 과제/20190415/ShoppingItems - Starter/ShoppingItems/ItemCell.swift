//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
  func itemCell(_ itemCell: ItemCell, didTapButton button: UIButton)
}

final class ItemCell: UITableViewCell {
  
  weak var delegate: ItemCellDelegate?
  let button = UIButton(type: .system)
  let tableView = UITableView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(button)
    button.setTitle("MyButton", for: .normal)
    button.backgroundColor = .yellow
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
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
  
  @objc func didTapButton(_ sender: UIButton) {
    delegate?.itemCell(self, didTapButton: sender)
  }
  
  
  
}
