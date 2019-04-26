//
//  ItemManager.swift
//  DominoPizzaExam
//
//  Created by JinBae Jeong on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

struct Category {
    var category: String
    var name: String
    var price: Int
    var count: Int

    let menu: [Menu] = [
        Menu(category: "슈퍼시드", name: "글램핑 바비큐", price: 10_000, count: 10),
        Menu(category: "슈퍼시드", name: "알로하 하와이안", price: 10_000, count: 10),
        Menu(category: "슈퍼시드", name: "우리 고구마", price: 10_000, count: 10),
        Menu(category: "슈퍼시드", name: "콰트로 치즈 퐁듀", price: 10_000, count: 10),
        
        Menu(category: "프리미엄", name: "더블크러스트 이베리코", price: 10_000, count: 10),
        Menu(category: "프리미엄", name: "블랙앵거스 스테이크", price: 10_000, count: 10),
        Menu(category: "프리미엄", name: "블랙타이거 슈림프", price: 10_000, count: 10),
        Menu(category: "프리미엄", name: "와규 앤 비스테카", price: 10_000, count: 10),
        Menu(category: "프리미엄", name: "직화 스테이크", price: 10_000, count: 10),
        
        Menu(category: "클래식", name: "베이컨체더치즈", price: 10_000, count: 10),
        Menu(category: "클래식", name: "불고기", price: 10_000, count: 10),
        Menu(category: "클래식", name: "슈퍼디럭스", price: 10_000, count: 10),
        Menu(category: "클래식", name: "슈퍼슈프림", price: 10_000, count: 10),
        Menu(category: "클래식", name: "페퍼로니", price: 10_000, count: 10),
        Menu(category: "클래식", name: "포테이토", price: 10_000, count: 10),
        
        Menu(category: "사이드디시", name: "딸기 슈크림", price: 10_000, count: 10),
        Menu(category: "사이드디시", name: "슈퍼곡물 치킨", price: 10_000, count: 10),
        Menu(category: "사이드디시", name: "애플 크러스트 디저트", price: 10_000, count: 10),
        Menu(category: "사이드디시", name: "치킨퐁듀 그라탕", price: 10_000, count: 10),
        Menu(category: "사이드디시", name: "퀴노아 치킨 샐러드", price: 10_000, count: 10),
        Menu(category: "사이드디시", name: "포테이토 순살치킨", price: 10_000, count: 10),
        
        Menu(category: "음료", name: "미닛메이드 스파클링 청포도", price: 10_000, count: 10),
        Menu(category: "음료", name: "스프라이트", price: 10_000, count: 10),
        Menu(category: "음료", name: "코카콜라 제로", price: 10_000, count: 10),
        Menu(category: "음료", name: "코카콜라", price: 10_000, count: 10),
        
        Menu(category: "피클소스", name: "갈릭 디핑 소스", price: 10_000, count: 10),
        Menu(category: "피클소스", name: "스위트 칠리소스", price: 10_000, count: 10),
        Menu(category: "피클소스", name: "우리 피클 L", price: 10_000, count: 10),
        Menu(category: "피클소스", name: "우리 피클 M", price: 10_000, count: 10),
        Menu(category: "피클소스", name: "핫소스", price: 10_000, count: 10),
    ]
}
