//
//  AddFeedViewController.swift
//  Instagram
//
//  Created by Wi on 30/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 카메라로 사진을 찍거나 앨범에서 사진을 선택할 시에 오게될 컨트롤러입니다.
// 오른쪽 상단에 공유버튼을 올리고 공유를 누르면 Feed를 추가합니다.
// 기본 값이 UITableViewController 입니다. 기본 뷰컨트롤러로 구현하고 싶으시면 타입을 UIViewController로 바꿔주세요.

class AddFeedViewController: UITableViewController {
    
    var image: UIImage?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        self.title = "새 게시물"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(sharedItemDidTap))
        
        tableView.register(UINib(nibName: "AddFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "addFeed")
    }
    
    @objc func sharedItemDidTap(_ sender: UIBarButtonItem){
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddFeedTableViewCell else { return }
        var str = cell.textView.text
        if cell.textView.text == "문구입력..." {
            str = ""
        }
        FeedManager.shared.addFeedData(FeedData(profileImage: user?.profileImage, nickName: user?.name, feedImage: image, explanation: str))
       navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addFeed", for: indexPath) as! AddFeedTableViewCell
        cell.feedImageView.image = self.image
        cell.selectionStyle = .none
        
        return cell
    }
    
}
