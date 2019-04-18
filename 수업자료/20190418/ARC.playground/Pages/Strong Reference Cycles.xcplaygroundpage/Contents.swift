//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person! = Person()
var tori: Dog! = Dog()

giftbot.pet = tori
tori.owner = giftbot

giftbot.doSomething()
tori.doSomething()


/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */
// 실제 값을 해제하기 위해서는
giftbot.pet = nil
// 또는
tori.owner = nil
// 서로 마주보고 있는 상황일 경우 둘중 하나만 nil로 선언해도 된다.

// Strong Reference Cycle
giftbot = nil
tori = nil
/*:
 ---
 ### Answer
 ---
 */
// 순서 주의

giftbot.pet = nil
tori.owner = nil

giftbot = nil
tori = nil




//: [Next](@next)
