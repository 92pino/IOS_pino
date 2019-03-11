import UIKit

/*
    변수와 상수
    변수와 상수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고 있는 컨테이너
 
    - 상수(Constans) : 한 번 설정되면 값 변경 불가
    - 변수(Variables) : 설정한 값을 변경 가능
*/

let maximumNumberOfLoginAttempts = 10
// 최대 로그인 시도 횟수는 10번으로 제한해놓았다.
// 더이상의 값 변경은 불가능.
// maximumNumberOfLoginAttempts = 20 ==> 불가능

// currentLoginAttempt = 1  ==> currentLoginAttempt라는 변수(상수)를 위에서 선언해놓지 않았으므로 xcode는 currentLoginAttempt라는 변수가 무엇을 의미하는지 모르므로 var 또는 let을 사용하지 않으면 오류를 발생시킨다.
var currentLoginAttempt = 0
currentLoginAttempt = 1
/*:
 ---
 */
/*
 
    Type Annotation & Type Inference
 
*/

// Type Annotation : 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것

let year: Int = 2019
let language: String = "Swift"

//var red, green, blue: Double
//red = 255.0
//green = 150.123
//blue = 75

// Type Inference : 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용

let name: String = "Pino"
type(of: name)

let age: Int = 4
type(of: age)

var weight = 6.4
type(of: weight)

var spelling = ["P", "I", "N", "O"]
type(of: spelling)
/*:
 ---
 */
/*

    Literals & Types
    - 상수 : 고정된 값(메모리 주소)을 가지는 심볼/식별자
    - 리터럴
        - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
        - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등
 
*/

// Numberic Literals

var signedInteger = 123 // Int
signedInteger = +123    // Int
signedInteger = -123    // Int
type(of: signedInteger)

let decimalInteger = 17 // Int
type(of: decimalInteger)
let binaryInteger = 0b10001 // Int
type(of: binaryInteger)

let octalInteger = 0o21 // Int
type(of: octalInteger)

let hexadecimalInteger = 0x11   //Int
type(of: hexadecimalInteger)

// Int 숫자 자리수가 클 경우 _를 사용하여 구분할 수 있다.
var bigNum = 10000000000000
bigNum = 1_000_000_000_000_0
bigNum = 0b1000_1000_000
bigNum = 0xAB_00_FF_00_FF

/*:
 ---
 */
/*
 
    Integer Types
 
    - UInt에 음수를 넣으면?
    - Int8 dp 127을 초과하는 숫자를 넣으면?
    - Int에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?
 
*/

// var question1: UInt8 = -1 ==> 오류발생
// var question2: Int8 = 127 + 1 ==> 오류 발생

/*:
 ---
 */
/*
 
    Typealias
    - 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
 
*/
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min

type(of: maxAmplitudeFound)
type(of: maxAmplitudeFound1)
/*:
 ---
 */
/*
 
    Type Conversion
 
*/

let height = Int8(5)
let width = 10

//let area = height * width
//print(area)
// => 오류의 원인은 상수 height와 상수 width의 타입이 Int8과 Int로 다르기 때문이다.

// 다음과 같이 수정하면 오류가 발생하지 않는다.
// 1. width의 값을 Int8로 형변환하기
// 2. height를 Int로 형변환하기
let area1 = Int(height) * width
let area = height * Int8(10)

let num = 10
let floatNum = Float(num)
type(of: floatNum)

/*
 
    magnitude, abs
 
*/

let integer = Int(-15)

let magnitude = integer.magnitude
let absNum = abs(integer)

type(of: magnitude) // UInt
type(of: absNum)    // Int

/*
 
    # magnitude와 abs의 차이점은?
        - magnitude와 abs는 절대값으로 값을 변환시킨다는 공통점을 가지고 있지만 magnitude는 UInt로, abs는 Int값으로 변환을 시켜준다.
 
        - 양수를 사용할 때 Int / UInt 중 어느 것이 좋을까?
 
 
*/

/*:
 ---
 */
/*
    연산자 우선순위
*/

// 삼항연산자
// a > 0 ? "positive" : "negative"
// ==
//if a > 0 {
//    "positive"
//} else {
//    "negative"
//}

/*:
 ---
 */
var value = 0
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2

value += 10
value -= 5
value *= 2
value /= 2
value %= 2

let e = 123.4
let f = 5.678
e / f

// e % f ==> 나머지의 경우 실수는 연산 불가능함.
// % 대신 remainder이나 truncatingRemainder를 사용해야함.

e.remainder(dividingBy: f)
e.truncatingRemainder(dividingBy: f)
/*:
 ---
 */
// &&
true && true // true
true && false // false
false && true // false
false && false // false

// ||
true || true // true
true || false // true
false || true // true
false || false // false

// !
!true // false
!false // true
/*:
 ---
 */
/*
 
    삼항연산자
 
*/
// a > 0 ? "positive" : "zero or negative"
//if a > 0 {
//    "positive"
//} else {
//    "zero or negative"
//}

/*:
 ---
 */
/*
    range
*/

for idx in 1...5 {
    print("\(idx) times 5 is \(idx * 5)")
}

0..<100
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// 범위 연산의 순서를 반대로 (내림차순) 적용하려면?
/*
    for idx in 1...5 {
        print("\(idx) times 5 is \(idx * 5)")
    }
*/

for idx in (1...5).reversed() {
    print("\(idx) times 5 is \(idx * 5)")
}
