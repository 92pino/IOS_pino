//
//  EmojiSelector.swift
//  StoryboardDesignableExample
//
//  Created by 이봉원 on 14/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class EmojiSelectorView: UIView {
  
  let emojiDisplayLabel = UILabel()
  let upButton = UIButton(type: .system)
  let downButton = UIButton(type: .system)
  
  let emojis = [
    "😀", "😃", "😄", "😆", "😅",
    "🤲", "👐", "🙌", "👏", "🤝",
    "🐶", "🐱", "🐭", "🐹", "🐰"
  ]
  
  var something: Int = 0
  var currentIndex: Int = 0
  
  var emojiAreaRatio: CGFloat = 0.7
  var emojiLabelBgColor: UIColor?
  var emojiFontSize: CGFloat = 50
  
  var upButtonBgColor: UIColor?
  var downButtonBgColor: UIColor?
  var buttonFontSize: CGFloat = 30
  
  // MARK: - Initialize
  
  
  
  // MARK: - View Layout
  
  
  
  // MARK: - Action Handler
  
  @objc func didTapUpDownButton(_ sender: UIButton) {
  }
  
}
