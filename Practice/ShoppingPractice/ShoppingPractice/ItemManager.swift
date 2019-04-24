//
//  ItemManager.swift
//  ShoppingPractice
//
//  Created by JinBae Jeong on 25/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

struct ItemManager {
    
    // [제품명 : 재고]
    var stocks: [String: Int] = [
        "iPhone SE (Gold)": 4,
        "iPhone SE (RoseGold)": 5,
        "iPhone 8": 3,
        "iPhone X (White)": 7,
        "iPhone X (Space Gray)": 6,
        
        "iPhone SE (Gold)-1": 3,
        "iPhone SE (RoseGold)-1": 6,
        "iPhone 8-1": 2,
        "iPhone X (White)-1": 5,
        "iPhone X (Space Gray)-1": 7,
        
        "iPhone SE (Gold)-2": 8,
        "iPhone SE (RoseGold)-2": 2,
        "iPhone 8-2": 5,
        "iPhone X (White)-2": 4,
        "iPhone X (Space Gray)-2": 3,
    ]
    
    let items: [ShoppingItem] = [
        IPhone(title: "iPhone SE (Gold)", imageName: "iPhone8"),
        IPhone(title: "iPhone SE (RoseGold)", imageName: "iPhoneSE_RoseGold"),
        IPhone(title: "iPhone 8", imageName: "iPhoneSE_Gold"),
        IPhone(title: "iPhone X (White)", imageName: "iPhoneX_White"),
        IPhone(title: "iPhone X (Space Gray)", imageName: "iPhoneX_SpaceGray"),
        
        IPhone(title: "iPhone SE (Gold)-1", imageName: "iPhone8"),
        IPhone(title: "iPhone SE (RoseGold)-1", imageName: "iPhoneSE_RoseGold"),
        IPhone(title: "iPhone 8-1", imageName: "iPhoneSE_Gold"),
        IPhone(title: "iPhone X (White)-1", imageName: "iPhoneX_White"),
        IPhone(title: "iPhone X (Space Gray)-1", imageName: "iPhoneX_SpaceGray"),
        
        IPhone(title: "iPhone SE (Gold)-2", imageName: "iPhone8"),
        IPhone(title: "iPhone SE (RoseGold)-2", imageName: "iPhoneSE_RoseGold"),
        IPhone(title: "iPhone 8-2", imageName: "iPhoneSE_Gold"),
        IPhone(title: "iPhone X (White)-2", imageName: "iPhoneX_White"),
        IPhone(title: "iPhone X (Space Gray)-2", imageName: "iPhoneX_SpaceGray")
    ]
    
    func checkOrderAvailability(title: String, orderAmount: Int) -> Bool {
        return stocks.keys.contains { $0 == title } && stocks[title]! >= orderAmount
    }

}
