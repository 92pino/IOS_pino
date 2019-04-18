//: [Previous](@previous)
/*:
 # ARC Basic
 */

class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}


/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1")
obj1 = nil


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2")
var countUp = obj2


obj2 = nil
countUp = nil


/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3")
var array = [obj3, obj3]

obj3 = nil
array.remove(at: 0)
array.remove(at: 0)



/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 약한 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */

print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4")
print(strongObj4)

//weak var weakObj4 = Person(testCase: "case4")
//print(weakObj4)

//unowned var unownedObj4 = Person(testCase: "case4")
//print(unownedObj4)



/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4줄의 코드 중 사용 불가능한 것은?

//unowned let unownedLet = strongObj4
//unowned var unownedVar = strongObj4
//weak let weakLet = strongObj4
//weak var weakVar = strongObj4


// unowned 와 weak 의 타입은?
//print("Unowned type: ", type(of: unownedVar))
//print("Weak type: ", type(of: weakVar))



//: [Next](@next)
