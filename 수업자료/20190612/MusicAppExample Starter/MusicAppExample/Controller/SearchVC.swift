//
//  SearchVC.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import AVKit

class SearchVC: UITableViewController {
    
    // MARK: - Properties
    private let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    var player: AVPlayer?
    var searchWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // searchController configure
        searchControllerConfigure()
        
        // search data configure
        getSearchData(searchTerm: "kidmilli")
        
        // cell register
        tableView.register(TrackCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CurrentPlayMusicFooterView.self, forHeaderFooterViewReuseIdentifier: "PlayingView")
        
        // tableView separatorInset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
    }
    // MARK: - configure
    private func searchControllerConfigure() {
        self.navigationItem.searchController = searchController
        // 업데이트가 뭐가 되었는지 알기 위해서
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search music"
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
    // MARK: - tableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackCell
        cell.track = self.tracks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let url = URL(string: tracks[indexPath.row].previewUrl) else {
            return
        }
        
        let avPlayerController = AVPlayerViewController()
        player = AVPlayer(url: url)
        /**
         present해서 음악 재생
        avPlayerController.player = player
        present(avPlayerController, animated: true, completion: nil)
        **/
        
        guard let footerView = tableView.footerView(forSection: 0) as? CurrentPlayMusicFooterView else { return }
        
        footerView.track = tracks[indexPath.row]
        footerView.isPlaying = true
        
        player = AVPlayer(url: url)
        player!.play()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayingView") as! CurrentPlayMusicFooterView
        footerView.delegate = self
        return footerView
    }
    
    // MARK: - Networking
    
    private func getSearchData(searchTerm: String) {
        
        let defaultSession = URLSession(configuration: .default)
        guard var urlComponent = URLComponents(string: "https://itunes.apple.com/search") else {
            return
        }
        
        urlComponent.query = "media=music&entity=song&term=\(searchTerm)"
        
        guard let url = urlComponent.url else { return }
        
        let dataTaks = defaultSession.dataTask(with: url) { (data, response, error) in
            
            // error
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    self.tracks = result.results
                    print(self.tracks)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        
        dataTaks.resume()
        
    }
    
}

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if searchWord != nil {
            getSearchData(searchTerm: searchWord ?? "")
        } else {
            getSearchData(searchTerm: searchBar.text ?? "")
        }
    }
    
}

extension SearchVC: UISearchControllerDelegate {
    func willDismissSearchController(_ searchController: UISearchController) {
        
        searchWord = searchController.searchBar.text
        
    }
}

extension SearchVC: CurrentPlayMusicFooterViewDelegate {
    func playPauseButtonDidTap(footerView: CurrentPlayMusicFooterView) {
        guard let player = self.player else { return }
        
        if footerView.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        
        footerView.isPlaying.toggle()
    }
}
