//
//  ViewController.swift
//  textFieldExample
//
//  Created by JinBae Jeong on 06/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /****************
         
         기본 속성 지정
         
        ****************/
        // 기본값
        textField.text = "Sample"
        // 대문자 변환
        textField.autocapitalizationType = UITextAutocapitalizationType.sentences
        // 자동완성
        textField.autocorrectionType = UITextAutocorrectionType.no
        //틀린 문자열 체크
        textField.spellCheckingType = UITextSpellCheckingType.no
        // 키보드 타입
        textField.keyboardType = UIKeyboardType.numberPad
        // 키보드 외형
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        // 리턴키 타입
        textField.returnKeyType = UIReturnKeyType.join
        // 리턴키 자동 활성화
        textField.enablesReturnKeyAutomatically = true
        // 비밀번호 포맷
        textField.isSecureTextEntry = true
        // 내부에 클리어 버튼 표시
        textField.clearButtonMode = UITextField.ViewMode.always
        // 편집 시작시 기존 내용 삭제
        textField.clearsOnBeginEditing = true
        
        /****************
         
         스타일 설정
         
         ****************/
        
        // 테두리 스타일
        textField.borderStyle = UITextField.BorderStyle.line
        
        // 테두리 색상
        textField.layer.borderColor = UIColor.gray.cgColor
        
        // 테두리 두께
        textField.layer.borderWidth = 1.0
        
        // 수직방향 텍스트 배열 위치
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
    }


}

