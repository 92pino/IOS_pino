//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by JinBae Jeong on 08/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class NewSegue: UIStoryboardSegue {

    override func perform() {
        // 세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        
        // 세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        
        // fromView에서 toView로 뷰를 전환한다
        // from : 출발지 뷰
        // to : 목적지 뷰
        // duration : 화면 전환에 소요되는 시간(단위:초)
        // options: 애니메이션 전환 옵션
        // completion : 화면 전환이 끝난 후 실행할 함수나 클로저 구문
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
    
}
