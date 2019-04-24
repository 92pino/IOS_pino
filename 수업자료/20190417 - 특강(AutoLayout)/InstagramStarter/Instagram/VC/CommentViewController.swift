//
//  CommentViewController.swift
//  Instagram
//
//  Created by JinBae Jeong on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        // Get the height and width of the View.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)) // Register the Cell name.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sectionTableViewCell") // Set the DataSource.
        tableView.dataSource = self // Set Delegate.
        tableView.delegate = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(self.tableView)
    }

}

extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
}

extension CommentViewController: UITableViewDelegate {
    
}
