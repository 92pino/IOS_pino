//
//  ProductViewController.swift
//  DominoPizza
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    var result = [basicData]()
    var tableView = UITableView()
    var seed = Data.shared.pizzas
    
    func find(){
        for i in seed {
            if (i.folder == self.title) {
                result.append(i)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        print(result)
        // Do any additional setup after loading the view.
    }

}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(result.count)
        return result.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
//        cell.imageView = UIImage(named: resul)
        return cell
    }


}
