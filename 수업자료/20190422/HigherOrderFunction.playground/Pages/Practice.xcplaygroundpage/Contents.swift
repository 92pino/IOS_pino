//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Practice 1
 ---
 */

print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
    return pets
        .filter { ($0.type == .dog) }
        .reduce(0) { $0 + $1.age }
}
print(sumDogAge(pets: myPet))

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
    return pets.map {
        Pet(type: $0.type, age: $0.age + 1)
    }
}
oneYearOlder(of: myPet)
/*:
 ---
 ## Practice 2
 ---
 */

print("\n---------- [ Practice 2 ] ----------\n")

let immutableArray = Array(1...40)
//
//immutableArray.enumerated()
//    .map(*)
//    .filter({ $0 & 1 == 0})
//    .reduce(0, +)
//
//print(immutableArray)
//
//let array = ["1j", "2d", "3", "4"]
//
//let m1 = array.map({ Int($0) })         // nil, nil, optional(3), optional(4)
//let f1 = array.compactMap({ Int($0) }) // 3, 4
//
//let m2 = array.map({ Int($0) })[0]          // nil
//let f2 = array.compactMap({ Int($0) })[0]   // 3

func multiplyByIndex(index: Int, number: Int) -> Int {
    return index * number
}
func isEven(number: Int) -> Bool {
    return number & 1 == 0
}
func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

var sum = 0
for (index, num) in immutableArray.enumerated() {
    let multipliedNum = multiplyByIndex(index: index, number: num)
    if isEven(number: multipliedNum) {
        sum = addTwoNumbers(lhs: sum, rhs: multipliedNum)
    }
}
    print(sum)
/*:
 ---
 ## Practice 3
 ---
 */

print("\n---------- [ Practice 3 ] ----------\n")

let array2: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]

let q1 = array2.map({ ($0) })
let q2 = array2.map{$0.compactMap{$0}}
let q3 = array2.flatMap({ ($0) })
let q4 = array2.flatMap{$0.compactMap{$0}}
print(q1)
print(q2)
print(q3)
print(q4)
//: [Next](@next)
