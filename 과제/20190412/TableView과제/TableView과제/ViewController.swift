//
//  ViewController.swift
//  TableView과제
//
//  Created by JinBae Jeong on 14/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 20
    var numbers: [Int] = []
    var selected: [IndexPath] = []
    var selectedArr: [Int] = []
    var selectedNumArr: [Int] = []
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createTableView()
        refreshControl()
    }
    
    // tableView 생성
    func createTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        view.addSubview(tableView)
    }
    
    func refreshControl() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        refreshControl.addTarget(self, action: #selector(randomRefresh), for: .valueChanged)
    }
    
    @objc func randomRefresh() {
        numbers.removeAll()
        
        tableView.refreshControl?.endRefreshing()
    }
    
    func random(){
        let numberValue = (1...(count + 50)).randomElement()
        guard !numbers.contains(numberValue!) else { return random() }
        numbers.append(numberValue!)
        guard numbers.count >= 20 else { return random() }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (numbers[indexPath.row] < 7) {
            return nil
        }
        
        return indexPath
    }
}
