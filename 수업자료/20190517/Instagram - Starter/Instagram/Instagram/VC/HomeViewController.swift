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
    let feedArr = [FeedData]()
    
    let tableView: UITableView = {
       let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        tableView.dataSource = self
        
        naviSetting()
        NotificationCenter.default.addObserver(self, selector: #selector(photoSelected)
            , name: NSNotification.Name("photoSelected"), object: nil)
    }
    
    func naviSetting() {
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraAction(_:))), animated: true)
    }
    
    @objc func cameraAction(_ sender: UIButton) {
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true)
    }
    
    @objc private func photoSelected(_ sender: Notification){
        print(1111)
        guard let image = sender.userInfo!["image"] as? UIImage else { return }
        
        let vc = AddFeedViewController()
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Feed", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedArr[indexPath.row]
        return cell
    }
    
    
}
