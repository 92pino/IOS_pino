//
//  ViewController.swift
//  ViewControllerTransition
//
//  Created by JinBae Jeong on 02/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

/*
 
 2. 스토리보드 이용할 것
 - FirstVC 에 개, 고양이, 새 라는 이름의 UIButton 3개 생성
 - SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
 - FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
 (이미지는 구글링 등을 통해 활용)
 - 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
 - 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현
 
 [도전과제]
 2.
 class Car {}
 let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
 
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

