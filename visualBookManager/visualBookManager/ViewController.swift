//
//  ViewController.swift
//  visualBookManager
//
//  Created by JinBae Jeong on 28/11/2018.
//  Copyright © 2018 JinBae Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myBookManager = BookManager()
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나", genre: "전쟁소설", author: "헤밍웨이")
        let book3 = Book(name: "죄와벌", genre: "사실주의", author: "톨스토이")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func registerAction(_ sender:Any){
        var bookTemp = Book()
        
        bookTemp.name = nameTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        outputTextView.text = "\(nameTextField.text!) has been registered"
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func searchAction(_ sender:Any){
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        } else {
            outputTextView.text = "We don't have book that you search. ^^;"
        }
    }
    
    @IBAction func showAllBookAction(_ sender: Any){
//        print("ShowAllBookAction")
        
        outputTextView.text = myBookManager.showAllBooks()
    }
    
    @IBAction func removeAction(_ sender: Any){
        myBookManager.removeBook(name: nameTextField.text!)
        outputTextView.text = "\(nameTextField.text!) remove"
        countLabel.text = "\(myBookManager.countBooks())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

