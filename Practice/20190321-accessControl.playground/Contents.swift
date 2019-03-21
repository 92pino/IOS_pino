import UIKit

// struct 최고 : public
// class 최고 : open

protocol Human {
    var name: String { get }
    var height: Double { get }
    var age: Int { get }
    var weight: Double { get }
}

protocol Owner {
    var name: String { get }
    
    func promote()
    func hire()
}

protocol Chef {
    var position : String { get }
    
    func cook()
    func decorate()
    func buyFoodIngredients()
}

protocol Customer {
    var money: Int { get }
    
    func order()
    func eat()
    func rateRestaurant()
}
/*
```Q. 캡슐화 적용해보기
- A가 서울에서 부산까지 여행을 가기로 함
- A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
- 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
- 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 외부에서는 자세한 내용은 알거나 수정하지 못함```
*/
 
class A {
    private var location = "서울"
    
    private func something() {
        print("딴짓1")
    }
    
    private func something2() {
        print("딴짓2")
    }
    
    func currentLocation() {
        print("현재위치 : ", location)
    }
    
    func goToBusan() {
        print("서울을 출발합니다.")
        something()
        something2()
        print("부산에 도착했습니다.")
        location = "부산"
    }
    
}

let a = A()
a.currentLocation()
a.goToBusan()
a.currentLocation()

class Cat {
    let leg = 4
    func cry() {
        print("miaow")
    }
}

class KoreanShortHair: Cat {}

let cat = Cat()

let koShort = KoreanShortHair()
koShort.cry()
koShort.leg

class Person {
    var age: Int?
    func eat() {
        
    }
}

let person = Person()
person.age = 28
person.age

class Student: Person {
    var grade: Int = 3
    func study() {
        
    }
}
let student = Student()
student.grade = 3
student.grade
student.study()

class UniversityStudent: Student {
    var major: String?
    override func study() {
        print("10")
    }
}
let universityStudent = UniversityStudent()
universityStudent.major = "Math"
print(universityStudent.major!)

class Dog {
    
    func bark(){
        print("짖어")
    }
}

class Poodle: Dog {
    override func bark() {
        print("푸푸푸드드들")
    }
}

class Husky: Dog {
    override func bark() {
        print("허허허허스키")
    }
}

class Bulldog: Husky {
    override func bark() {
        print("부르도그")
    }
}

let poodle = Poodle()
poodle.bark()

let husky = Husky()
husky.bark()

let bulldog = Bulldog()
bulldog.bark()
