//: [Previous](@previous)
/*:
 # Equatable, Identical
 */

// 동등 연산자
1 == 1
2 == 1
"ABC" == "ABC"


class Person {
  let name = "이순신"
  let age = 30
}

let person1 = Person()
let person2 = Person()

//person1 == "이순신"    // 타입이 다르다
//person1 == person2   // 어떤 값을 비교해야되는지?


/*:
 ---
 ### Question
 - 왜 비교 연산자를 사용할 수 없을까요?
 ---
 */

/*:
 ---
 ### Equatable Protocol
 ---
 */
// 클래스끼리 비교할때는 Equatable

class User: Equatable {
  var name = "이순신"
  let age = 30
  
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.name == rhs.name
    // name만 다루고 있으므로 age는 달라도 상관없다.
  }
}

let user1 = User()
var user2 = User()
user1 == user2


/*:
 ---
 ### Identical
 ---
 */

user1.name
user2.name
user1 == user2  // 단순 값이 같은지 비교
user1 === user2 // 저장되는 위치가 다르므로 메모리 주소가 다르다 == false

// ===는 refereceType에만 가능


/***************************************************
 let x = 5
 let y = User()
 let z = User()
 
         x   y        z
 [Stack] | 5 | 0x5F17 | 0x2C90 |
 
      0x2C90         0x5F16      0x5F17
 [Heap] | z's user data | SomeData | y's user data |
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 ***************************************************/

user1.name = "홍길동"
user1.name   //
user2.name   //
user1 == user2
user1 === user2


user1.name
user2.name
//
user2 = user1
user2.name
//
user1 == user2    //
user1 === user2   // user1에 넣은 메모리값을 user2에 동일하게 넣는다
//
//user2.name = "세종대왕"
//user1.name     //


/***************************************************
 Class Identity Operators
 === : Returns true when two constants or variables pointing to a same instance
 ***************************************************/

//1 === 1
//"A" === "A"

// 5 == 5


//: [Next](@next)
