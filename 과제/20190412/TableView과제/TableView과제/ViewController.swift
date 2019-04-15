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
    var selecteds: [IndexPath] = []
    var seledcedArray: [Int] = []
    var seledtedNumArray: [Int] = []
    
    var tableView = UITableView()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSelectNum()
        setupTableView()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        selected()
        numbers = []
        addSelectNum()
        seledcedArray = []
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.allowsMultipleSelection = true
        tableView.isMultipleTouchEnabled = true
        tableView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
    
    func addSelectNum(){
        guard seledcedArray != [] else {
            makeRand()
            return
        }
        for i in seledcedArray {
            numbers.append(i)
        }
        makeRand()
    }
    
    func makeRand() {
        if numbers.count < count {
            #if swift(>=4.2)
            let num = (1...count).randomElement()!
            #else
            let num = Int(arc4random_uniform(UInt32(count+50))) // swift 4.2ver 아래는 이렇게 랜덤값 호출
            #endif
            if !numbers.contains(num) {
                numbers.append(num)
            }
            return makeRand()
        }
    }
    
    func selected() {
        guard let index = tableView.indexPathsForSelectedRows else {
            return
        }
        self.selecteds = index
        for i in selecteds {
            seledcedArray.append(numbers[i.row])
        }
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
//        guard numbers[indexPath.row] > 7 else { return nil }
        if (numbers[indexPath.row] < 7) {
            // 선택을 했어도 선택이 되지 않음
            return nil
        }
        return indexPath
    }
}
