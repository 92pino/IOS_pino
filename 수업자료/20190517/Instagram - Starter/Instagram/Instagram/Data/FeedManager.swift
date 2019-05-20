//
//  FeedManager.swift
//  Instagram
//
//  Created by Wi on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


// 매니저 클래스의 유무는 선택사항입니다.

class FeedManager {
    // 싱글턴 선언
    static let shared = FeedManager()
    
    // feedData 배열선언
    var allFeedData = [FeedData]()
    
    private init(){}
    
    //feedData 추가 함수
    func addFeedData(_ feedData: FeedData){
        allFeedData.append(feedData)
    }
    
    //feedData 반환 함수
    func returnFeedData() -> [FeedData]{
        return allFeedData
    }
}
