//
//  ViewController.swift
//  ShoppingPractice
//
//  Created by JinBae Jeong on 25/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let itemManager = ItemManager()
    private lazy var items: [ShoppingItem] = ItemManager().items
    private var orderItems: [String: Int] = [:]
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell, for: <#T##IndexPath#>)
    }
    
    
}
