//
//  FirebaseCenter.swift
//  Firebase_practice
//
//  Created by JinBae Jeong on 2019/07/20.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import Firebase

class FirebaseCenter {
    static let shared = FirebaseCenter()
    
    private var ref: DatabaseReference!
    private var remoteConfig: RemoteConfig!
    
    private init() {
        self.remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        fetchConfig()
    }

    private func fetchConfig() {
        
        // 캐시된 데이터를 버리고 다시 불러오는 데 걸리는 시간
        let expirationDuration: Int = 0
        remoteConfig
            .fetch(withExpirationDuration: TimeInterval(expirationDuration)) { [weak self] (status, error) -> Void in
                if status == .success {
                    self?.remoteConfig.activateFetched()
                } else {
                    print("Config not fetched")
                    print("Error \(error!.localizedDescription)")
                }
        }
    }
    
    func getData() -> String {
        guard let data = remoteConfig["card_data"].stringValue else {
            return ""
        }
        
        return data
    }
}
