//
//  MainViewController.swift
//  Instagram
//
//  Created by Wi on 29/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
// VC들을 가지고있을 탭바입니다.
// 탭바컨트롤러에서 어떤일을 해야할지 생각해보세요.

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    
    let homeVC = HomeViewController()
    let plusVC = PlusViewController()
    let MyVC = MyViewController()
    let picker = UIImagePickerController()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        plusVC.delegate = homeVC
        settingTabBar()
    }
    
    func settingTabBar() {
        homeVC.tabBarItem = UITabBarItem(title: "test", image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        plusVC.tabBarItem = UITabBarItem(title: "test1", image: UIImage(named: AppImageData.plus
        ), selectedImage: UIImage(named: AppImageData.plus))
        viewControllers = [UINavigationController.init(rootViewController: homeVC), plusVC, UINavigationController.init(rootViewController: MyVC)]
    }
    
    // 탭바를 선택했을때 불릴 함수 입니다.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == plusVC {
            picker.sourceType = .photoLibrary
            present(picker, animated: true)
            return false
        }
        
        return true
    }
    
}

extension MainTabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NotificationCenter.default.post(name: NSNotification.Name("photoSelected"), object: nil, userInfo: ["image":info[.originalImage] as Any])
        
        picker.dismiss(animated: true, completion: nil)
    }
}
