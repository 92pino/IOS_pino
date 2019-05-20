//
//  LoginViewController.swift
//  kakaoApi
//
//  Created by JinBae Jeong on 20/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
        
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler: { (error) in
            if !session.isOpen() {
                // 에러
                if let error = error as NSError? {
                    // KOErrorCode
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("Login Success")
                AppDelegate.instance.setupRootViewController()
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
        
    }

}
