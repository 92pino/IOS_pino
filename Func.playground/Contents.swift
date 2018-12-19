import UIKit
//
////var year:Int = 1999
////var message:String = "Hello, world"
////
////1 ..< 5
////
////let a = 1
////let b = 5
////
////for row in a ... b {
////    row
////}
////
////for row in a ..< b {
////    row
////}
////
////for row in 1..<10 {
////    print("2 X \(row) = \(row * 2)")
////}
////
////let minYear = 1940
////let maxYear = 2018
////
////for year in minYear ... maxYear {
////    print("\(year) 년도")
////}
////
////var lang = "Swift"
////
////for count in lang.characters {
////    print("\(count)")
////}
////
//////let size = 10
//////let padChar = " "
//////var keyword = "*"
//////
//////for _ in 1...size {
//////    keyword = padChar + keyword + padChar
//////}
//////
//////print("\(keyword)")
////
////let size = 2
////let padChar = "*"
////var keyword = "*"
////
////for i in 0...size {
////    for _ in 0...i {
////        print(keyword)
////        keyword = padChar + keyword
////    }
////}
////
////func divide(base: Int) {
////
////    guard base != 0 && base > 0 && base < 100 else {
////        print("오류")
////        return
////    }
////
////    // 동일한 if문
////    /*
////         if base == 0 {
////            return
////         }
////     */
////
////    let result = 100 / base
////    print(result)
////}
////divide(base: 200)
////
////let val = 10
////switch val {
////case 1 :
////    print("일치한값 1")
////case 2 :
////    print("일치한값 2")
////case 3 :
////    print("일치한값 3")
////default :
////    print("일치한값 없음")
////}
////
////var text = "This is a swift book for Apple's programming language"
////var result = ""
////
////for char in text.characters {
////    if char == " " {
////        result.append(Character("_"))
////        continue
////    } else if char == "o" {
////        result.append(Character("O"))
////        continue
////    }
////    result.append(char)
////}
////print(result)
////
////var cities = ["Seoul", "New Yrok", "LA", "Santiago"]
////let length = cities.count
////for i in 0..<length{
////    print("\(i)번째 배열 원소는 \(cities[i])입니다.")
////}
////
////for row in cities {
////    let idx = cities.index(of: row)
////    print("\(idx!)번째 배열 원소는 \(row)입니다.")
////}
////
////var cnt = 30
////
////func autoIncrement(value: inout Int) -> Int {
////    var value = value
////    value += 1
////
////    return value
////}
////
////print(autoIncrement(value: &cnt))
////print(cnt)
////
////func foo(paramCount: inout Int ) -> Int{
////    paramCount += 1
////    return paramCount
////}
////var count = 30
////print(foo(paramCount: &count))
////print(count)
////
////do {
////    var ccnt = 0
////    do {
////        ccnt = 3
////        print(ccnt)
////    }
////    print(ccnt)
////    ccnt += 1
////    print(ccnt)
////}
////
//
////var count = 30
////func foo() -> Int {
////    count += 1
////    return count
////}
////foo()
////
////func foo2(test: Int) -> Int {
////    var test = count
////    test += 1
////    return test
////}
////foo2(test: count)
////count
////
////func foo(base: Int) -> String {
////    return "결과값은 \(base + 1)입니다."
////}
////let fn1 = foo(base:5)
////fn1
////
////let fn4 = foo
////fn4(2)
////
////func boo(age: Int) -> String {
////    return "\(age)"
////}
////boo(age:10)
////let fn: (Int) -> String = boo
////fn(20)
////
////func desc() -> String {
////    return "this is desc()"
////}
////func pass() -> () -> String {
////    return desc
////}
////let p = pass()
////p()
//
//func plus(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//func minus(a: Int, b: Int) -> Int {
//    return a - b
//}
//
//func times(a: Int, b: Int) -> Int {
//    return a * b
//}
//
//func divide(a: Int, b: Int) -> Int {
//    guard b != 0 else {
//        return 0
//    }
//
//    return a / b
//}
//
//func calc(_ operand: String) -> (Int, Int) -> Int {
//
//    switch operand {
//    case "+" :
//        return plus
//    case "-" :
//        return minus
//    case "*" :
//        return times
//    case "/" :
//        return divide
//    default :
//        return plus
//    }
//
//}
//let c = calc("+")
//c(2,5)
//
//func incr(param: Int) -> Int {
//    return param + 1
//}
//func broker(base: Int, function fn: (Int) -> Int) -> Int {
//    return fn(base)
//}
//broker(base: 3, function: incr)
//
//func successThrough() {
//    print("연산 처리가 성공했습니다.")
//}
//
//func failThrough(){
//    print("연산 처리가 실패했습니다.")
//}
//
//func divide(base: Int, success sCallBack: () -> (), fail fCallBack: () -> ()) -> Int {
//    guard base != 0 else {
//        fCallBack()
//        return 0
//    }
//
//    defer {
//        sCallBack()
//    }
//    return 100
//}
//divide(base: 30, success: successThrough, fail: failThrough)
//
////func outer(base: Int) -> String {
////    func inner(inc: Int) -> String {
////        return "\(inc)를 반환합니다."
////    }
////    let result = inner(inc: base + 1)
////    return result
////}
////outer(base: 3)
//
//func outer(param: Int) -> (Int) -> String {
//    let value = param + 20
//    func inner(inc: Int) -> String {
//        return "\(value + inc)를 리턴합니다."
//    }
//    return inner
//}
//let fn1 = outer(param: 80)
//let fn2 = fn1(30)
//
//func basic(param: Int) -> (Int) -> Int {
//    let value = param + 20
//    func append(add: Int) -> Int {
//        return value + add
//    }
//
//    return append
//}
//let result = basic(param:20)
//result(10)

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

let insRes = Resolution()
let width = insRes.width

class VideoMode {
    var interlaced: Bool = false
    var frameRate: Double = 0.0
    var name: String?
    
    var res = Resolution()
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}
let insVMode = VideoMode()
let vMode = VideoMode()
vMode.name = "Sample"
vMode
print("vMode 인스턴스의 width 값은 \(insVMode.res.width)")

var res = vMode.res
res.width = 120
res.height = 100

vMode.res.width

let defaultRes = Resolution(width: 1024, height: 768)
defaultRes.width

let hd = Resolution(width:1024, height: 768)
var cinema = hd
cinema.width = 2048
cinema
hd

vMode.name = "Original Video Instance"
print("\(vMode.name!)")
