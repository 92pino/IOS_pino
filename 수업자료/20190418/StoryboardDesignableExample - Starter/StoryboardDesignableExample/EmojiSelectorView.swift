//
//  EmojiSelector.swift
//  StoryboardDesignableExample
//
//  Created by 이봉원 on 14/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

@IBDesignable
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
    @IBInspectable var currentIndex: Int = 0 {
        didSet {
            let index = currentIndex % emojis.count
            let adjustmentIndex = index < 0 ? index + emojis.count : index
            emojiDisplayLabel.text = emojis[adjustmentIndex]
        }
    }
  
    @IBInspectable var emojiAreaRatio: CGFloat = 0.7 {
        didSet {
            layoutViews()
        }
    }
    @IBInspectable var emojiLabelBgColor: UIColor? {
        didSet {
            emojiDisplayLabel.backgroundColor = emojiLabelBgColor
        }
    }
    @IBInspectable var emojiFontSize: CGFloat = 50 {
        didSet{
        emojiDisplayLabel.font = .systemFont(ofSize: emojiFontSize)
        }
    }
  
    @IBInspectable var upButtonBgColor: UIColor? {
        didSet {
            upButton.backgroundColor = upButtonBgColor
        }
    }
    @IBInspectable var downButtonBgColor: UIColor? {
        didSet {
            downButton.backgroundColor = downButtonBgColor
        }
    }
    @IBInspectable var buttonFontSize: CGFloat = 30 {
        didSet {
            upButton.titleLabel?.font = .systemFont(ofSize: buttonFontSize)
            downButton.titleLabel?.font = .systemFont(ofSize: buttonFontSize)
        }
    }
  
  // MARK: - Initialize
  
    // 코드로 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // 스토리보드로 초기화
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        addSubview(emojiDisplayLabel)
        addSubview(upButton)
        addSubview(downButton)
        
        emojiDisplayLabel.text = emojis.first
        emojiDisplayLabel.textAlignment = .center
        emojiDisplayLabel.font = UIFont.systemFont(ofSize: 50)
        
        upButton.setTitle("⬆︎", for: .normal)
        upButton.setTitleColor(.black, for: .normal)
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        upButton.titleLabel?.textAlignment = .center
        upButton.layer.borderWidth = 1
        upButton.layer.borderColor = UIColor.black.cgColor
        upButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
        
        downButton.setTitle("⬇︎", for: .normal)
        downButton.setTitleColor(.black, for: .normal)
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        downButton.titleLabel?.textAlignment = .center
        downButton.layer.borderWidth = 1
        downButton.layer.borderColor = UIColor.black.cgColor
        downButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
    }
  
  // MARK: - View Layout
  
    override func layoutSubviews() {
        super.layoutSubviews()
        let emojiWidth = frame.width * emojiAreaRatio
        emojiDisplayLabel.frame = CGRect(x: 0, y: 0, width: emojiWidth, height: frame.height)
        
        upButton.frame = CGRect(x: emojiWidth, y: 0, width: frame.width - emojiWidth, height: frame.height / 2)
        
        downButton.frame = CGRect(x: emojiWidth, y: frame.height / 2 , width: frame.width - emojiWidth, height: frame.height / 2)
        
        layoutViews()
    }
    
    func layoutViews() {
        
    }
  
  // MARK: - Action Handler
  
  @objc func didTapUpDownButton(_ sender: UIButton) {
    /*
    var loopNum = currentIndex % emojis.count
    let adjustmentIndex = loopNum < 0 ? loopNum + emojis.count : loopNum
    if upButton.isTouchInside {
        currentIndex += 1
        emojiDisplayLabel.text = emojis[adjustmentIndex]
    } else {
        print(loopNum)
        currentIndex -= 1
        emojiDisplayLabel.text = emojis[adjustmentIndex]
    }
     */
    print(sender)
    currentIndex += (sender == upButton) ? 1 : -1
    
  }
  
}
