//: [Previous](@previous)
/*:
 # Class
 */
/***************************************************
 Value Type => struct, enum  (Stack 에 저장)
 Reference Type => class  (Heap 에 저장)
 ***************************************************/

/***************************************************
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 // ClassName() ==> heap에 데이터 저장 // instance 생성
 
 class - 정의
 instance - class를 메모리에 생성한 것
 object -instance를 담아두고 실제 사용하는 것
 
 let <#instanceName#> = <#ClassName()#>
 instanceName.<#propertyName#>
 instanceName.<#functionName()#>
 ***************************************************/


class Dog {
    // 상태 데이터
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
    // 행동 정의
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog()
bobby.color // default값 white
bobby.color = "Gray"
bobby.color
bobby.sit()

// stack, heap
// stack : bobby = 주소값 ex) 0x0001 -> heap : bobby's dog data

let tory = Dog()
tory.color = "Brown"
tory.layDown()

var test1: Dog = Dog()
test1.color = "Gray"
var test2: Dog = Dog()
test2.color = "Brown"

var temp: Dog?

temp = test1
test1 = test2
test2 = temp!

test1.color

/*:
 ---
 ### Question
 - 자동차 클래스 정의 및 객체 생성하기
 ---
 */
/***************************************************
 자동차 클래스
 - 속성: 차종(model), 연식(model year), 색상(color) 등
 - 기능: 운전하기(drive), 후진하기(reverse) 등
 ***************************************************/






/*:
 ---
 ### Answer
 ---
 */
class Car {
  let model = "리어카"
  let modelYear = 2016
  let color = "Cream White"
  
  func drive() {
    print("전진")
  }
  func reverse() {
    print("후진")
  }
}

let car = Car()
car.model
car.modelYear
car.color
car.drive()
car.reverse()



//: [Next](@next)
