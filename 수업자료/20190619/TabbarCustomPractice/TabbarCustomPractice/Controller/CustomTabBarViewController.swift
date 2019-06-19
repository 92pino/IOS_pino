//
//  CustomTabBarViewController.swift
//  TabbarCustomPractice
//
//  Created by JinBae Jeong on 19/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {

    // MARK: - Properties
    
    let menuBar = MenuBar()
    
    let pageCollectionView: UICollectionView = {
        
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        // 회색 indicatorbar 삭제
        collectionView.showsHorizontalScrollIndicator = false
        
        // 컬렉션뷰가 페이징 되도록
        // false일 경우 페이지 끊어짐 없이 쭉 이어서 스크롤
        collectionView.isPagingEnabled = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        
        return collectionView
    }()
    
    var menuTitles = ["menu1", "menu2", "menu3", "menu4", "menu5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTabBar()
    }
    
    private func configureCustomTabBar() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.menuTitles = menuTitles
        view.addSubview(menuBar)
        view.addSubview(pageCollectionView)
        
        let guide = view.safeAreaLayoutGuide
        
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
        
        // page collection view
        
        // delegation
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        menuBar.delegate = self
        
        // register
        pageCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
        // layout autolayout
        pageCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension CustomTabBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = menuTitles[indexPath.row]
        
        return cell
    }
    
    
}

extension CustomTabBarViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menuTitles.count)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        menuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension CustomTabBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - menuBar.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // 셀과 셀 사이의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CustomTabBarViewController: MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath) {
        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}
