//
//  UserManager.swift
//  Instagram
//
//  Created by JinBae Jeong on 08/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class UserManager {
  
  static let shared = UserManager()
  
  private var userDefaults = UserDefaults.standard
  
  private var user = User(userName: "", profileImage: nil)
  
  private init() {}
  
  func changeUserName(userName: String, completion: (Bool, String) -> ()) {
    guard let localUserData = userDefaults.array(forKey: "userName"), var userNames = localUserData as? [String] else {
      userDefaults.set([userName], forKey: "userName")
      self.user.userName = userName
      completion(true, userName)
      return
    }
    if userNames.contains(userName) {
      completion(false, "중복된 닉네임입니다.")
      return
    }
    userNames.append(userName)
    userDefaults.setValue(userNames, forKey: "userName")
    self.user.userName = userName
    completion(true, userName)
  }
  
  func getUserInfo(completion: (User) -> ()) {
    completion(self.user)
  }
  
  func changeUserInfo(user: User, completion: (User) -> ()) {
    self.user = user
    completion(self.user)
  }
  
}
