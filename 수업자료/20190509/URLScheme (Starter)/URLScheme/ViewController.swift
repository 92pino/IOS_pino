//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2019. 5. 4..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  // 해당 앱의 설정 화면
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { return }
    
    // < 5 - UIApplicationOpenSettingsURLString
    // >= 5 - UIApplication.openSettingsURLString
    
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url)
    } else {
      UIApplication.shared.openURL(url)
    }
  }
  
  // ex) 개발자에게 문의하기 메일
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
    
//    let scheme = "mailto:"
//    let scheme = "mailto:jjb8382@gmail.com" // 받는 사람 지정
    // 참조, 타이틀, 본문 내용
//    let scheme = "mailto:?cc=jjb8382@gmail.com&subject=title&body=MyText"
    // 받는사람, 참조, 타이틀, 본문 내용
    let scheme = "mailto:jjb8382@mgmail.com?cc=jjb8382@gmail.com&subject=title&body=MyText"
    
    guard let url = URL(string: scheme), UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }

  // 문자 보내기
  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
    
    // 기본 sms
//    let url = URL(string: "sms:")!
    // 받는사람 지정 sms
//    let url = URL(string: "sms:010-1111-2222")!
    // 메세지 포함 sms
    let url = URL(string: "sms:010-1111-2222&body=Hello")!
//    let url = URL(string: "sms:")!
    
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let url = URL(string: "https://github.com/92pino")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
  
  // ⬆︎ 시스템 앱
  // ⬇︎ 3rd Party 앱
  
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
    // iOS 9.0 이상부터 화이트 리스트 등록 (info.plist에서 LSApplicationQueriesSchemes 등록)
    
    // url 한글 보낼 경우 인코딩 변경
    var str = "어니언"
    var urlStr = "instagram://tag?name=\(str)"
    let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let instagram = URL(string: encoded)!
    print(instagram)
    
    guard UIApplication.shared.canOpenURL(instagram) else { return }
    UIApplication.shared.open(instagram)
  }
  
  // 내가 만든 scheme로 이동
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    let myAppUrl = URL(string: "myApp://host?name=abc&age=10")!
    
    guard UIApplication.shared.canOpenURL(myAppUrl) else { return }
    UIApplication.shared.open(myAppUrl)
  }
}




