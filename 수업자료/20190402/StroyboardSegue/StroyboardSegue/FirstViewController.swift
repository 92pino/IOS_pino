//
//  ViewController.swift
//  StroyboardSegue
//
//  Created by JinBae Jeong on 02/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var count = 0
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 화면 전환을 할건지 안할건지에 대한 메서드
    // prepare 이전에 발생
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        return count < 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("\n--------------- [ prepare] --------------- \n")
        print("segue :", segue.destination)   // 도착지
        
        guard let dest = segue.destination as? SecondViewController, let id = segue.identifier else { return }
        
        count +=  id == "PlusOne" ? 1 : 10
        dest.count = count
        
        // sender - 이벤트를 보내는 객체 (버튼 이벤트)
        
        
    }

    // ActionSegue -> ShouldPerformSegue -> Prepare
    // ManualSegue -> Should(x) -> PerformSegue -> Prepare
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.source)
        guard let source = unwindSegue.source as? SecondViewController else { return }
        count -= source.minus
        
        countLabel.text = "\(count)"
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    @IBAction private func didTapPlusOneButton(_ sender: Any) {
        performSegue(withIdentifier: "PlusOne", sender: sender)
    }
    
    @IBAction func didTapPlusTenButton(_ sender: Any) {
        performSegue(withIdentifier: "PlusTen", sender: sender)
    }
}

