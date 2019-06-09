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
    
    // itunes songs list
    private var songs: itunesSongs?
    
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

    private func searchApi(_ searchText: String) {
        
        guard var components = URLComponents(string: "https://itunes.apple.com/search") else { return print("cant't create URL") }
        
        components.queryItems = [
            URLQueryItem.init(name: "media", value: "music"),
            URLQueryItem.init(name: "entity", value: "song"),
            URLQueryItem.init(name: "term", value: searchText),
        ]
        
        guard let url = try? components.asURL() else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return print(error?.localizedDescription)}
            guard let response = response as? HTTPURLResponse,
                200..<400 ~= response.statusCode
                else { return print("StatusCode is not valid")}
            
            if let musicData = try? JSONDecoder().decode(itunesSongs.self, from: data!)
            {
                let count = musicData.resultCount as? Int,
                array = musicData.results
                
                var result = self.songs?.results
                
                for info in array {
                    if let artistName = info.artistName as? String,
                        let trackName = info.trackName as? String,
                        let artworkUrl100 = info.artworkUrl100 as? String,
                        let imageUrl = URL(string: artworkUrl100),
                        let imageData = try? Data(contentsOf: imageUrl),
                        let image = UIImage(data: imageData) {
                        result?.append(Result(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100))
                    }

                }
                
                
                self.songs = itunesSongs(resultCount: count!, results: result ?? [])
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }.resume()
    }

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunes", for: indexPath) ?? UITableViewCell(style: .subtitle, reuseIdentifier: "itunes")
//        cell.imageView?.image = songs?.results[indexPath.row].artworkUrl100
//        cell.textLabel?.text =
//            songs?.results[i]
//            songs?.results[indexPath.row].artistName
//        cell.detailTextLabel?.text = songs?.results[indexPath.row].trackName
        
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let text = searchBar.text else { return false }
        
        searchApi(text)
        
        return true
    }
}
