//: [Previous](@previous)
/*:
 # Type Annotation & Type Inference
 */

/*:
 ---
 ## Type Annotation
 * 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것
 ---
 */
let year: Int = 2019

let language: String
language = "Swift"

var red, green, blue: Double
red = 255.0
green = 150.123
blue = 75

/*:
 ---
 ## Type Inference
 * 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용하는 것
 ---
 */
let name: String = "Tori"
// type(of: name)

let age: Int = 4
// type(of: age)

var weight = 6.4
// type(of: weight)

var spelling = ["T", "O", "R", "I"]
// type(of: spelling)

//: [Next](@next)
