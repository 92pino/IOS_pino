//: [Previous](@previous)
/*:
 # Type Conversion
 */

// 형변환

let height = Int8(5)
let width = 10
//let area = height * width
//print(area)
// 타입이 달라서 연산이 되지 않는다.


let h = UInt8(25)
type(of: h)
let x = 10 * h
type(of: x)
print(x)

/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num)
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)



// magnitude, abs

let integer = Int(-15)

let magnitude = integer.magnitude
type(of: magnitude)
let absNum = abs(integer)
type(of: absNum)

// magnitude : UInt로 절대값
// abs : Int값으로 절대값
// abs를 주로 사용
/*:
 ---
 ## Question
 - magnitude 와 abs 의 차이점은?
 - 양수를 사용할 때 Int / UInt 중 어느 것이 좋을까?
   - 사용성, 안전성, 타입 추론, 변환 등
 ---
 */
// 양수를 사용할 때 Int를 주로 사용
// UInt를 사용하기위해서는 UInt라는 변환을 무조건 필요로 해서 불편하다
// 자료 찾아보기
//: [Next](@next)
