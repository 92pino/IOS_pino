//
//  ViewController.swift
//  itunesAlamofire
//
//  Created by JinBae Jeong on 07/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var url = "https://itunes.apple.com/search?media=music&entity=song&term=*"
    // itunes songs list
    private var musicInfo: [Result] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view .addSubview(tableView)
        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "itunes")
        autoLayout()
        search()
    }
    
    private func search() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        // Setup other SearchController Setting
        
        searchController.searchBar.placeholder = "Search Songs"
        
        // 검색 할 때 배경을 어둡게 할지 밝게할지
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    private func autoLayout() {
        tableView.layout.top().leading().trailing().bottom()
    }

    private func searchApi() {
        let req = AF.request(url)
        req.validate().responseData { (response) in
            switch response.result {
            case .success(let value):
                guard let musicList = try? JSONDecoder().decode(itunesSongs.self, from: value) else { return }
                self.musicInfo = musicList.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunes", for: indexPath) ?? UITableViewCell(style: .subtitle, reuseIdentifier: "itunes")
        
        let url = musicInfo[indexPath.row].artworkUrl100
        let imgURL = URL(string: url ?? "")!
        
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: imgURL) {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data)
                }
            }
        }
        
        print(musicInfo)
        
        cell.textLabel?.text = musicInfo[indexPath.row].artistName
        cell.detailTextLabel?.text = musicInfo[indexPath.row].trackName
        print(musicInfo[indexPath.row].trackName)
        
        
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let text = searchBar.text else { return false }
        url = "https://itunes.apple.com/search?media=music&entity=song&term=\(searchBar.text!)"
        searchApi()
        
        return true
    }
}
