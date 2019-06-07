//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2019. 6. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    
    let url = URL(string: imageUrlStr)!
    
    // sync async 동기, 비동기
    // 동기 : 호출한 메서드가 종료될 때까지 기다렸다가 다음 작업 수행
    // 비동기 : 메서드를 호출만 하고 완료를 기다리지 않고 다음 작업 수행
    /*
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
        }
    */
    
    // 동기이지만 비동기처럼 작동하게 하는 법
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /***************************************************
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag
     scheme - http
     
     ***************************************************/

    var components = URLComponents()
    components.scheme = "http"
    
    components.user = "username"
    components.password = "password"
    components.host = "www.example.com"
    components.port = 80
    components.path = "/index.html"
    components.query = "key1=value1&key2=value2"
    components.fragment = "frag"
    
    components.queryItems = [
        URLQueryItem(name: "key1", value: "value1"),
        URLQueryItem(name: "key2", value: "value2")
    ]
    print(components)
    
    var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag")
    comp?.fragment = "myFragment"
    print(comp)
  }
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    // 영문 주소
    let urlStringE = "https://search.naver.com/search.naver?&query=swift"
    
    if let url = URL(string: urlStringE) {
        print(url)
    } else {
        print("nil")
    }
    
    // URI : ASCII IRI - UTF8
    // 한글 주소
    let urlStringK = "https://search.naver.com/search.naver?&query=한글"
    
    if let url = URL(string: urlStringK) {
        print(url)
    } else {
        print("nil")
    }
    
    // Query 부분 변환
    let str = "https://search.naver.com/search.naver?&query=한글"
    
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let convert = URL(string: queryEncodedStr)!
    print(convert)
    
    let originalString = "color-#708090"
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
    print(encodedString)    // prints "color-%23708080"
    
    let encodedUrlString = "https://example.com/#color-%23708090"
    let url = URL(string: encodedUrlString)!
    let components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    
    let fragment = components.fragment!
    print(fragment)
    
    // 문자열 디코딩
    print(encodedUrlString.removingPercentEncoding ?? "")
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")

    _ = URLSession.shared
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral
    _ = URLSessionConfiguration.background(withIdentifier: "backgroundID")
    
    let sessionConfig = URLSessionConfiguration.default
    // 기본값 true. Wi-fi만 사용가능하도록 할 때는 false
    sessionConfig.allowsCellularAccess = false
    
    // 기본값 4
    sessionConfig.httpMaximumConnectionsPerHost = 5
    
    // 기본값 60초
    sessionConfig.timeoutIntervalForRequest = 20
    
    // 기본값 .useProtocolCachePolicy
    sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData
    
    // 기본값 false.
    sessionConfig.waitsForConnectivity = true
    
    
    // 16 KB == (16 * 1024 = 16384)
    // 256 MB == (256 * 1024 * 1024 = 268435456)
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    sessionConfig.urlCache = myCache
    
    // 기본적인 저장 경로
    // Disk path: (user home directory)/Library/Cacges/(application bundle Id)
    
    // 경로 알아내기
    print(FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0])
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    print(cache.diskCapacity)
    print(cache.currentDiskUsage)
    
     cache.removeAllCachedResponses() // 캐시 전체 삭제
    
    let mySession = URLSession(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    let task = mySession.dataTask(with: url) { [weak self] (data, response, error) in
        guard let data = data else { return }
        DispatchQueue.main.async {
            self?.imageView.image = UIImage(data: data)!
            print("download complete")
        }
        
    }
    task.resume()
  }
  

  // MARK: - Get, Post, Delete
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    let apiURL = URL(string: todoEndpoint)!
    
    struct User: Codable {
        let userId: Int
        let id: Int
        let title: String
        let completed: Bool
    }
    
    URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else { return print("StatusCode is not valid")}
        if let user = try? JSONDecoder().decode(User.self, from: data!) {
            print(user)
        }
    }.resume()
    
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    
    let newTodo: [String: Any] = [
        "userId" : 1,
        "title" : "My First todo",
        "completed" : false,
    ]
    
    guard let encodedTodo = try? JSONSerialization.data(withJSONObject: newTodo) else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = encodedTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error?.localizedDescription)}
        guard let data = data else { return print("Error: did not receive data") }
        
        guard let receivedTodo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return}
        
        print(response)
    }
    task.resume()
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    
    let newTodo: [String: Any] = [
        "userId" : 1,
        "title" : "My First todo",
        "completed" : false,
    ]
    
    guard let encodedTodo = try? JSONSerialization.data(withJSONObject: newTodo) else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "Delete"
    urlRequest.httpBody = encodedTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error?.localizedDescription)}
        guard let data = data else { return print("Error: did not receive data") }
        
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode else { return }
        
        guard let receivedTodo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return}
        
        print(receivedTodo)
        print(response.statusCode)
    }
    task.resume()
    
  }
}

