import UIKit

let f = { () -> Void in
    print("클로저 실행")
}
f()

let q01 = {(str: String) -> Int in
    return str.count
}
print(q01("swift"))

let q02 = {(num01: Int, num02: Int) -> Int in
    return num01 * num02
}
q02(10, 10)

let q03 = {(num: Int) -> Bool in
    return num % 2 == 0
}
q03(5)

let q04 = {(num: Int) -> Int in
    return num + 1
}
q04(4)

var value = [1,9,5,7,3,2]

struct UserInfo {
    var birth: Int
    
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            print(df)
            return Int(df.string(from: Date()))
        }
    }
    
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

var test = UserInfo(birth: 1992)
test.age

struct Rect {
    var originX: Double = 0.0, originY: Double = 0.0
    
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        
        set {
            originX = newValue - (sizeWidth / 2)
            print(originX)
        }
    }
    
    var centerY: Double {
        get {
            return self.originY + (sizeHeight / 2)
        }
        
        set {
            originY = newValue - (sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("\(square.centerX), \(square.centerY)")
