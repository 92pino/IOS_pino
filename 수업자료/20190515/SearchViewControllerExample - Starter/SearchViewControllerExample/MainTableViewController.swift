//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var dataArr = menuData
    var filteredDataArr = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        
        // 모든 데이터를 채워주는 영역
        dataArr.forEach {
            filteredDataArr += $0.menu
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        
//        self.searchController.searchBar.scopeButtonTitles = MenuData
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let resuableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = resuableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredDataArr[indexPath.row].name
        cell.detailTextLabel?.text = String(filteredDataArr[indexPath.row].price)
        
        return cell
    }
    
    
    // MARK: - For Search method


}

extension MainTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
