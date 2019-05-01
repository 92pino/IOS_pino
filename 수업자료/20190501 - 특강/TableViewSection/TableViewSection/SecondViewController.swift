//
//  SecondViewController.swift
//  TableViewSection
//
//  Created by JinBae Jeong on 01/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  let scrollView = UIScrollView()
  var sectionTitle: [String] = []
  var tableCell: [String] = []
  let products: [Product] = []
  
  let sectionView = UIView()
  let sectionTitleView = UILabel()
  

  override func viewDidLoad() {
      super.viewDidLoad()
    view.addSubview(scrollView)
    view.backgroundColor = .white
    
      // Do any additional setup after loading the view.
    create()
    autoLayout()
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
  private struct Standard {
    static let space: CGFloat = 10
    
    static let sectionLabelHeight: CGFloat = 60
    static let cellLabelHeight: CGFloat = 40
  }
  
  func create(){
    var labels: [UILabel] = []
    for i in 0...menuDatas.count - 1 {
      let sectionLabel = UILabel()
      sectionLabel.backgroundColor = .lightGray
      sectionLabel.text = menuDatas[i].category
      sectionLabel.heightAnchor.constraint(equalToConstant: Standard.sectionLabelHeight).isActive = true
      labels.append(sectionLabel)
      
      var productList = menuDatas[i].products
      for j in 0...productList.count - 1 {
        let cellLabel = UILabel()
        cellLabel.backgroundColor = .white
        cellLabel.text = productList[j].name
        cellLabel.heightAnchor.constraint(equalToConstant: Standard.sectionLabelHeight).isActive = true
        labels.append(cellLabel)
      }
    }
    
    for i in labels {
      scrollView.addSubview(i)
      i.translatesAutoresizingMaskIntoConstraints = false
      
      i.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
      i.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
      i.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    for i in 0..<labels.count {
      switch i {
      case 0:
        labels[0].topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        // 중간 cell
      case labels.count - 1:
        labels[labels.count - 1].topAnchor.constraint(equalTo: labels[labels.count - 2].bottomAnchor).isActive = true
        labels[labels.count - 1].bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // last cell
      default :
        labels[i].topAnchor.constraint(equalTo: labels[i - 1].bottomAnchor).isActive = true
      }
    }
  }

}
