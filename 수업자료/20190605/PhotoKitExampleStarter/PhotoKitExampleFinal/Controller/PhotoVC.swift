//
//  PhotoVC.swift
//  PhotoKitExampleFinal
//
//  Created by Wi on 04/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "PhotoCell"
private let reuseHeaderIndentifier = "PhotoHeader"

class PhotoVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        
        collectionView.backgroundColor = .white
        
        
        
    }
    
    // MARK: - UICollectionView

    // MARK: UICollectionViewFlowLayout
    
    // MARK: UICollctionViewDatasource
    
    
    // MARK: - Photos func
    
    func fetchPhotos(){
        
    }
    
}
