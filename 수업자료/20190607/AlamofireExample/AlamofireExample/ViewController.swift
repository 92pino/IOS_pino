//
//  ViewController.swift
//  AlamofireExample
//
//  Created by JinBae Jeong on 07/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit        // A -> Z SystemFramework > 3rd Party
import Alamofire

class ViewController: UIViewController {
    
    let btn: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("버튼", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return button
    }()
    
    let btn2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("버튼", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        view.addSubview(btn2)
        
        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        btn2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        btnAction()
        
    }

    private func btnAction() {
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(btnAction2(_:)), for: .touchUpInside)
    }
    
    @objc func btnAction(_ sender: UIButton) {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        let req = AF.request(urlString)
        req
            .validate()
            .responseJSON { response in
            switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    @objc func btnAction2(_ sender: UIButton) {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        let params: Parameters = [
            "title" : "MyTitle",
            "userId" : 1
        ]
        let req = AF.request(
            urlString,
            method: .post,
            parameters: params
        )
        req.responseJSON { (response) in
            // get : error 핸들링 때
            print(try? response.result.get())
        }
    }

}

