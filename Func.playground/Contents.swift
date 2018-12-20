import UIKit
////
//////var year:Int = 1999
//////var message:String = "Hello, world"
//////
//////1 ..< 5
//////
//////let a = 1
//////let b = 5
//////
//////for row in a ... b {
//////    row
//////}
//////
//////for row in a ..< b {
//////    row
//////}
//////
//////for row in 1..<10 {
//////    print("2 X \(row) = \(row * 2)")
//////}
//////
//////let minYear = 1940
//////let maxYear = 2018
//////
//////for year in minYear ... maxYear {
//////    print("\(year) 년도")
//////}
//////
//////var lang = "Swift"
//////
//////for count in lang.characters {
//////    print("\(count)")
//////}
//////
////////let size = 10
////////let padChar = " "
////////var keyword = "*"
////////
////////for _ in 1...size {
////////    keyword = padChar + keyword + padChar
////////}
////////
////////print("\(keyword)")
//////
//////let size = 2
//////let padChar = "*"
//////var keyword = "*"
//////
//////for i in 0...size {
//////    for _ in 0...i {
//////        print(keyword)
//////        keyword = padChar + keyword
//////    }
//////}
//////
//////func divide(base: Int) {
//////
//////    guard base != 0 && base > 0 && base < 100 else {
//////        print("오류")
//////        return
//////    }
//////
//////    // 동일한 if문
//////    /*
//////         if base == 0 {
//////            return
//////         }
//////     */
//////
//////    let result = 100 / base
//////    print(result)
//////}
//////divide(base: 200)
//////
//////let val = 10
//////switch val {
//////case 1 :
//////    print("일치한값 1")
//////case 2 :
//////    print("일치한값 2")
//////case 3 :
//////    print("일치한값 3")
//////default :
//////    print("일치한값 없음")
//////}
//////
//////var text = "This is a swift book for Apple's programming language"
//////var result = ""
//////
//////for char in text.characters {
//////    if char == " " {
//////        result.append(Character("_"))
//////        continue
//////    } else if char == "o" {
//////        result.append(Character("O"))
//////        continue
//////    }
//////    result.append(char)
//////}
//////print(result)
//////
//////var cities = ["Seoul", "New Yrok", "LA", "Santiago"]
//////let length = cities.count
//////for i in 0..<length{
//////    print("\(i)번째 배열 원소는 \(cities[i])입니다.")
//////}
//////
//////for row in cities {
//////    let idx = cities.index(of: row)
//////    print("\(idx!)번째 배열 원소는 \(row)입니다.")
//////}
//////
//////var cnt = 30
//////
//////func autoIncrement(value: inout Int) -> Int {
//////    var value = value
//////    value += 1
//////
//////    return value
//////}
//////
//////print(autoIncrement(value: &cnt))
//////print(cnt)
//////
//////func foo(paramCount: inout Int ) -> Int{
//////    paramCount += 1
//////    return paramCount
//////}
//////var count = 30
//////print(foo(paramCount: &count))
//////print(count)
//////
//////do {
//////    var ccnt = 0
//////    do {
//////        ccnt = 3
//////        print(ccnt)
//////    }
//////    print(ccnt)
//////    ccnt += 1
//////    print(ccnt)
//////}
//////
////
//////var count = 30
//////func foo() -> Int {
//////    count += 1
//////    return count
//////}
//////foo()
//////
//////func foo2(test: Int) -> Int {
//////    var test = count
//////    test += 1
//////    return test
//////}
//////foo2(test: count)
//////count
//////
//////func foo(base: Int) -> String {
//////    return "결과값은 \(base + 1)입니다."
//////}
//////let fn1 = foo(base:5)
//////fn1
//////
//////let fn4 = foo
//////fn4(2)
//////
//////func boo(age: Int) -> String {
//////    return "\(age)"
//////}
//////boo(age:10)
//////let fn: (Int) -> String = boo
//////fn(20)
//////
//////func desc() -> String {
//////    return "this is desc()"
//////}
//////func pass() -> () -> String {
//////    return desc
//////}
//////let p = pass()
//////p()
////
////func plus(a: Int, b: Int) -> Int {
////    return a + b
////}
////
////func minus(a: Int, b: Int) -> Int {
////    return a - b
////}
////
////func times(a: Int, b: Int) -> Int {
////    return a * b
////}
////
////func divide(a: Int, b: Int) -> Int {
////    guard b != 0 else {
////        return 0
////    }
////
////    return a / b
////}
////
////func calc(_ operand: String) -> (Int, Int) -> Int {
////
////    switch operand {
////    case "+" :
////        return plus
////    case "-" :
////        return minus
////    case "*" :
////        return times
////    case "/" :
////        return divide
////    default :
////        return plus
////    }
////
////}
////let c = calc("+")
////c(2,5)
////
////func incr(param: Int) -> Int {
////    return param + 1
////}
////func broker(base: Int, function fn: (Int) -> Int) -> Int {
////    return fn(base)
////}
////broker(base: 3, function: incr)
////
////func successThrough() {
////    print("연산 처리가 성공했습니다.")
////}
////
////func failThrough(){
////    print("연산 처리가 실패했습니다.")
////}
////
////func divide(base: Int, success sCallBack: () -> (), fail fCallBack: () -> ()) -> Int {
////    guard base != 0 else {
////        fCallBack()
////        return 0
////    }
////
////    defer {
////        sCallBack()
////    }
////    return 100
////}
////divide(base: 30, success: successThrough, fail: failThrough)
////
//////func outer(base: Int) -> String {
//////    func inner(inc: Int) -> String {
//////        return "\(inc)를 반환합니다."
//////    }
//////    let result = inner(inc: base + 1)
//////    return result
//////}
//////outer(base: 3)
////
////func outer(param: Int) -> (Int) -> String {
////    let value = param + 20
////    func inner(inc: Int) -> String {
////        return "\(value + inc)를 리턴합니다."
////    }
////    return inner
////}
////let fn1 = outer(param: 80)
////let fn2 = fn1(30)
////
////func basic(param: Int) -> (Int) -> Int {
////    let value = param + 20
////    func append(add: Int) -> Int {
////        return value + add
////    }
////
////    return append
////}
////let result = basic(param:20)
////result(10)
//
////struct Resolution {
////    var width = 0
////    var height = 0
////
////    func desc() -> String {
////        return "Resolution 구조체"
////    }
////}
////
////let insRes = Resolution()
////let width = insRes.width
////
////class VideoMode {
////    var interlaced: Bool = false
////    var frameRate: Double = 0.0
////    var name: String?
////
////    var res = Resolution()
////
////    func desc() -> String {
////        return "VideoMode 클래스"
////    }
////}
////let insVMode = VideoMode()
////let vMode = VideoMode()
////vMode.name = "Sample"
////vMode
////print("vMode 인스턴스의 width 값은 \(insVMode.res.width)")
////
////var res = vMode.res
////res.width = 120
////res.height = 100
////
////vMode.res.width
////
////let defaultRes = Resolution(width: 1024, height: 768)
////defaultRes.width
////
////let hd = Resolution(width:1024, height: 768)
////var cinema = hd
////cinema.width = 2048
////cinema
////hd
////
////vMode.name = "Original Video Instance"
////print("\(vMode.name!)")
////
////let video = VideoMode()
////
////func changeName(v: VideoMode) {
////    v.name = "Function Video Instance"
////}
////
////changeName(v: video)
////print("video 인스턴스의 name 값은 \(video.name!)입니다.")
////
////class User {
////    var name: String
////
////    init() {
////        self.name = ""
////    }
////}
//
//struct Resolution {
//    // 구조체의 내용 작성
//    var width = 0   // 프로퍼티
//    var height = 0  // 프로퍼티
//
//    // 메소드
//    func desc() -> String {
//        return "Resolution 구조체"
//    }
//}
//
//class VideoMode {
//    // 클래스의 내용 작성
//    var interlaced = false  // 프로퍼티
//    var frameRate = 0.0     // 프로퍼티
//    var name : String?      // 프로퍼티
//
//    var res = Resolution()
//
//    // 메소드
//    func desc() -> String {
//        return "VideoMode 클래스"
//    }
//}
//
//let insRes = Resolution()   // 구조체 인스턴스
//let width = insRes.width
//print("insRes 인스턴스의 width값은 \(width)입니다.")
//
//let insVMode = VideoMode()  // 클래스 인스턴스
//
//let vMode = VideoMode()
//print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다.")
//
//vMode.name = "Sample"
//vMode.res.width = 1280
//
//var res = vMode.res
//res.width = 1280
//vMode
//
//let defaultRes = Resolution(width: 1024, height: 768)
//
//let hd = Resolution(width:1920, height:1080)
//var cinema = hd
//cinema.width = 2048
//cinema
//hd
//
//let video = VideoMode()
//video.name = "Original Video Instance"
//video.name
//
//let dvd = video
//dvd.name = "DVD Video Instance"
//dvd.name
//video.name
//
//func changeName(v: VideoMode) {
//    v.name = "Function Video Instance"
//}
//changeName(v: video)
//print("video 인스턴스의 name 값은 \(video.name!)입니다.")
//
//let vs = VideoMode()
//let ds = VideoMode()
//
//vs.name = "test"
//ds.name = "test1"
//vs.name
//ds.name
//
//class User {
//
//    // 첫번째 해결방안
////    var name: String
////    init() {
////        self.name = ""
////    }
//
//    // 두번쨰 해결방안
//
////    var name: String?
////    var name: String!
//
//    // 세번째 해결방안
//    var name: String = ""
//
//}
//
//struct FixedLengthRange {
//    var startValue: Int
//    let length: Int
//}
//
//struct FlexibleLengthRange {
//    let startValue: Int
//    var length: Int
//}
//
//var rangeOfFixedIntegers = FixedLengthRange(startValue: 0, length: 3)
//rangeOfFixedIntegers.startValue = 4
//
//var rangeOfFlexibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)
//rangeOfFlexibleIntegers.length = 5
//
//class OnCreate {
//    init() {
//        print("OnCreate!!")
//    }
//}
//
//class LazyTest {
//    var base = 0
//    lazy var late = OnCreate()
//
//    init() {
//        print("Lazy Test")
//    }
//}
//
//let lz = LazyTest()
//lz.late
//
//class PropertyInit {
//    var value01: String! = {
//        print("value01 execute")
//        return "value011"
//    }()
//
//    let value02: String! = {
//        print("value02 execute")
//        return "value022"
//    }()
//
//    lazy var value03: String! = {
//        print("value03 execute")
//        return "value033"
//    }()
//}
////let s = PropertyInit()
////s.value03
//
//struct UserInfo {
//    var birth: Int!
//
//    var thisYear: Int! {
//        get {
//            let df = DateFormatter()
//            df.dateFormat = "yyyy"
//            return Int(df.string(from: Date()))
//        }
//    }
//
//    var age: Int {
//        get {
//            return (self.thisYear - self.birth) + 1
//        }
//    }
//}
//
//let info = UserInfo(birth: 1992)
//print(info.age)
//
////struct Rect {
////    var originX: Double = 0.0, originY:Double = 0.0
////
////    var sizeWidth: Double = 0.0, sizeHeight:Double = 0.0
////
////    var centerX: Double {
////        get {
////            return self.originX + (sizeWidth / 2)
////        }
////        set(newCenterX) {
////            originX = newCenterX - (sizeWidth / 2)
////        }
////    }
////
////    var centerY: Double {
////        get {
////            return self.originY + (sizeHeight / 2)
////        }
////        set(newCenterY) {
////            originY = newCenterY - (sizeHeight / 2)
////        }
////    }
////}
////
////var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
////print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")
//
//
//struct Position {
//    var x: Double = 0.0
//    var y: Double = 0.0
//}
//
//struct Size {
//    var width: Double = 0.0
//    var height: Double = 0.0
//}
//
//struct Rect {
//    var origin = Position()
//    var size = Size()
//
//    var center: Position {
//        get {
//            let centerX = self.origin.x + (self.size.width / 2)
//            let centerY = self.origin.y + (self.size.height / 2)
//            return Position(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            self.origin.x = newCenter.x - (size.width / 2)
//            self.origin.y = newCenter.y - (size.height / 2)
//        }
//
//    }
//}
//
//let p = Position(x: 0.0, y: 0.0)
//let s = Size(width: 10.0, height: 10.0)
//
//var square = Rect(origin: p, size: s)
//square.center.x
//square.center.y
//square.center = Position(x: 20.0, y: 20.0)
//square.origin
//
//struct Job {
//    var income: Int = 0 {
//        willSet(newIncome) {
//            print("이번달 월급은 \(newIncome)원입니다.")
//        }
//        didSet {
//            if income > oldValue {
//                print("월급이 \(income - oldValue)원 증가했네요. 소득세가 상향조정될 예정입니다.")
//            } else {
//                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드리비 않아요.")
//            }
//        }
//    }
//}
//
//var test = Job(income: 10000)
//test.income = 2000000
//
//struct Foo {
//    static var sFoo = "구조체 타입 프로퍼티값"
//
//    static var cFoo: Int {
//        return 1
//    }
//}
//
//class Boo {
//    static var sFoo = "클래스 타입 프로퍼티값"
//
//    static var cFoo: Int {
//        return 10
//    }
//
//    class var oFoo: Int {
//        return 100
//    }
//}
//print(Foo.cFoo)
//Foo.sFoo = "새로운 값"
//Foo.sFoo
//print(Boo.sFoo)
//Boo.sFoo = "새로운 값"
//Boo.sFoo
//Boo.oFoo
//Boo.oFoo

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        let desc = "이 해상도는 가로 \(self.width)  \(self.height)로 구성됩니다."
        return desc
    }
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}
