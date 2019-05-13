//
//  ProductListViewController.swift
//  DominoRepeat
//
//  Created by JinBae Jeong on 13/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

  var products: [Product] = []
  let tableView = UITableView()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
  
  private func configure() {
    
  }

}

extension ProductListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    cell.imageView?.image = UIImage(named: products[indexPath.row].name)
    cell.textLabel?.text = products[indexPath.row].name
    cell.detailTextLabel?.text = String(products[indexPath.row].price)
    
    return cell
  }
  
}

extension ProductListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    show(detailVC, sender: nil)
  }
}
