//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 피드데이터를 보여줄 컨트롤러 입니다.
// 왼쪽 상단에 카메라 버튼이 있습니다.

class HomeViewController: UIViewController {
    
    let picker = UIImagePickerController()
    let logo = UIImageView(image: UIImage(named:AppImageData.logo))
    var feedArr = [FeedData]()
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedArr = FeedManager.shared.returnFeedData()
        tableView.reloadData()
    }
    
    func configure() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableViewRegister()
        
        naviSetting()
        NotificationCenter.default.addObserver(self, selector: #selector(photoSelected)
            , name: NSNotification.Name("photoSelected"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pushCommentVC(_:)), name: NSNotification.Name("CommentTap"), object: nil)
        
        autoLayout()
    }
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    func naviSetting() {
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraAction(_:))), animated: true)
    }
    
    func tableViewRegister(){
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    @objc func cameraAction(_ sender: UIButton) {
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true)
    }
    
    @objc private func photoSelected(_ sender: Notification){
        guard let image = sender.userInfo!["image"] as? UIImage else { return }
        
        let vc = AddFeedViewController()
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushCommentVC(_ sender: Notification){
        print("pushComeentVC")
        guard let userInfo = sender.userInfo, let optionalCell = userInfo["cell"] , let cell = optionalCell as? UITableViewCell , let indexPath = tableView.indexPath(for: cell) else {return}
        let commentVC = CommentViewController()
//        commentVC.feedData = feedArr[indexPath.row]
        show(commentVC, sender: nil)
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vc = AddFeedViewController()
        
        vc.image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedArr[indexPath.row]
        return cell
    }
    
    
}
