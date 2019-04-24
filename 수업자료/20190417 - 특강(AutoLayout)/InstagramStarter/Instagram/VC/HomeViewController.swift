//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 빈 배열 만들고 초기화
    var feedDataArr = [FeedData]()
    
    
    // MARK: - Methods
    
    // MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: other func
    
    func configure(){
        // create dataArr
        createFeedData()
        
        // navigation item setting
        naviSetting()
        
        // tableViewSetting
        tableViewRegister()
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.separatorColor = .clear
        
        // addSubView
        view.addSubview(tableView)
        
        // autolayout
        autoLayout()
    }
    
    func createFeedData() {
        for i in 1...4 {
            let feedData = FeedData(profileImage: AppImageData.profile + "\(i)", nickName: "user\(i)", feedImage: AppImageData.feedImage + "\(i)")
            feedDataArr.append(feedData)
        }
        
//        let feedData1 = FeedData(profileImage: AppImageData.profile + "\(i)", nickName: "user\(i)", feedImage: AppImageData.feedImage + "\(i)")
    }
    
    func tableViewRegister(){
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    func naviSetting(){
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
    }
    
    // MARK: Action
    
    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem){
        print("camera Button Tap")
    }
    
    // MARK: AutoLayout
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }

}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.delegate = self
        cell.model = feedDataArr[indexPath.row]
        return cell
    }
    
    
}

extension HomeViewController: FeedTableViewCellDelegate {
    func feedCell(_ itemCell: FeedTableViewCell, didTapAddButton: UIButton) {
       
        guard let idxPath = tableView.indexPath(for: itemCell) else { return }
        let commentVC = CommentViewController()
        navigationController?.pushViewController(commentVC, animated: true)
        commentVC.title = didTapAddButton.titleLabel!.text!
    }
    
    
}
