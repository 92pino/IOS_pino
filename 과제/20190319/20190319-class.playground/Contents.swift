import UIKit

import UIKit

/*
 [ 과제 ]
 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0
 
 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0
 */

/*
 
 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
 구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
 
 */

class Dog {
    var name: String?
    var age: Int?
    var weight: Double?
    var dogKind: String?
    
    init(name: String, age: Int, weight: Double, dogKind: String){
        self.name = name
        self.age = age
        self.weight = weight
        self.dogKind = dogKind
    }
    
    func bowwow() {
        print("짖기")
    }
    
    func eat() {
        print("먹기")
    }
}

class Student {
    var name: String = "학생1"
    var age: Int = 28
    var schoolName: String = "패캠"
    var grade: Int = 1
    
    func study() {
        print("공부하기")
    }
    
    func eat() {
        print("먹기")
    }
    
    func sleep() {
        print("잠자기")
    }
}

class Iphone {
    var name: String
    var price: Int
    var faceId: Bool
    
    init(){
        name = "iphoneXSMAX"
        price = 1000000
        faceId = true
    }
    
    func call() {
        print("전화걸기")
    }
    
    func sms() {
        print("문자보내기")
    }
}

class Coffee {
    var name: String?
    var price: Int?
    var origin: String?
    
    init(name: String, price: Int, origin: String){
        self.name = name
        self.price = price
        self.origin = origin
    }
}
// 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기

class Calculator {
    
    // 계산기 처음 켰을때 0으로 초기값 지정
    var accumulator: Int = 0
    
    func add(_ num: Int) -> Int {
        accumulator = accumulator + num
        return accumulator
    }
    
    func subtract(_ num: Int) -> Int {
        accumulator = accumulator - num
        return accumulator
    }
    
    func multiply(_ num: Int) -> Int {
        accumulator = accumulator * num
        return accumulator
    }
    
    func divide(_ num: Int) -> Int {
        accumulator = accumulator / num
        return accumulator
    }
    
    func reset() {
        accumulator = 0
        print("0으로 초기화되었습니다.")
    }
}
let result = Calculator()
result.add(10)
result.accumulator
result.multiply(20)
result.accumulator
result.reset()


