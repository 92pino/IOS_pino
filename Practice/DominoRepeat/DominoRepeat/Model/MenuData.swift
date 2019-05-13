//
//  MenuData.swift
//  DominoRepeat
//
//  Created by JinBae Jeong on 13/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

struct MenuData {
  let category: String
  let products: [Product]
}

struct Product {
  let name: String
  let price: Int
}

let menuDatas: [MenuData] = [
  MenuData(category: "슈퍼시드", products: [
      Product(name: "글램핑 바비큐", price: 35900),
      Product(name: "알로하 하와이안", price: 25900),
      Product(name: "우리 고구마", price: 31900),
      Product(name: "콰트로 치즈 퐁듀", price: 25900)
    ]
  ),
  MenuData(category: "프리미엄", products: [
      Product(name: "더블크러스트 이베리코", price: 34900),
      Product(name: "블랙앵거스 스테이크", price: 25900),
      Product(name: "블랙타이거 슈림프", price: 31900),
      Product(name: "와규 앤 비스테카", price: 25900),
      Product(name: "직화 스테이크", price: 25900)
    ]
  )
]
