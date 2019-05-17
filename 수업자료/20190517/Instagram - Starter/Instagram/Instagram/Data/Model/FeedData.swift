//
//  FeedData.swift
//  Instagram
//
//  Created by Wi on 14/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation
import UIKit

// 피드데이터를 만들어보세요.
// 피드데이터가 가지고 있을 데이터는 무엇인지 생각해보세요.
// 피드데이터는 클래스로 만들어졌습니다. 
class FeedData {
    let profileImage: UIImage?
    let nickName: String?
    let feedImage: UIImage?
    var comment: [String]? = ["테스트"]
    let explanation: String?
    
    init(profileImage: UIImage?, nickName: String?, feedImage: UIImage?, explanation: String?) {
        self.profileImage = profileImage ?? UIImage(named: AppImageData.profile + "\(3)")
        self.nickName = nickName ?? "NickName"
        self.feedImage = feedImage ?? UIImage(named: AppImageData.feedImage + "\(1)")
        self.explanation = explanation
    }
}
