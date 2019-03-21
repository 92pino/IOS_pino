import UIKit

// 1. 첨부된 이미지를 보고 상속을 이용해 구현해보기
class Animal {
    var brain: Bool = true
    var legs: Int
    
    init(legs: Int = 0) {
        self.legs = legs
    }
}
let animal = Animal()
animal.legs
animal.brain

class Human: Animal {
    init() {
        super.init()
        self.legs = 2
    }
}

let human = Human()
human.legs

class Pet: Animal {
    var fleas: Int
    
    init() {
        self.fleas = 0
        
        super.init()
        self.legs = 4
    }
}

let pet = Pet()
pet.legs
pet.fleas

class Dog: Pet {
    init(fleas: Int = 8) {
        super.init()
        self.fleas = fleas
    }
}
let dog = Dog()
dog.legs
dog.fleas

class Cat: Pet {
    init(fleas: Int = 4) {
        super.init()
        self.fleas = fleas
    }
}
let cat = Cat()
cat.legs
cat.fleas

// 2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기(클래스 구현 연습)

print("================== 결과 ==================")
class Square {
    var s: Double
    
    init(s: Double) {
        self.s = s
    }
    func A(){
        print(s * s)
    }
    func P(){
        print(4 * s)
    }
}
let square = Square(s: 2)
square.A()
square.P()

print("================== 결과 ==================")
class Rectangle {
    var w: Int
    var l: Int
    
    init(w: Int, l: Int) {
        self.w = w
        self.l = l
    }
    
    func A() {
        print(l * w)
    }
    
    func P() {
        print((2 * l) + (2 * w))
    }
}
let rectangle = Rectangle(w: 2, l: 4)
rectangle.A()
rectangle.P()

print("================== 결과 ==================")
class Circle {
    var r: Double
    var pi: Double = 3.14
    
    init(r: Double) {
        self.r = r
    }
    
    func A() {
        print(pi * r * r)
    }
}
let circle = Circle(r: 2.0)
circle.A()
