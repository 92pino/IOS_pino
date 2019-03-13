import UIKit

// if ~ else if / if문을 2개 사용 하는 것과의 차이점은?
// 1번
var number = 9
if number < 10 {
    print("10보다 작다")
} else if number < 20 {
    print("20보다 작다")
}

if number < 10 {
    print("10보다 작다")
}
if number < 20 {
    print("20보다 작다")
}

/*
    첫 조건을 만족하면 다음 else 조건은 무시하고 넘어간다
    하지만 if문을 2개 사용 할 경우 2개 조건을 다 실행한다.
 */

// 2번

number = 100
if number < 10 {
    print("10보다 작다")
} else if number < 20 {
    print("20보다 작다")
} else if number >= 20 {
    print("20과 같거나 크다")
}
/*:
 ---
 */
/*
    switch
*/

let alphabet: Character = "a"

switch alphabet {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    break
}

var temperatureInFahrenheit: Int = 50

switch temperatureInFahrenheit {
case ...32:
    print("It's very cold. Consider wearing a scart.")
case 86...:
    print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}

let someCharacter: Character = "e"

switch someCharacter{
case "a","e","i","o","u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let someNum:Int = 11

switch someNum {
case let Num where Num % 2 == 0:
    print("짝수")
    // Num의 범위는 여기까지
    //-----------------------
default:
    print("홀수")
}

switch someNum % 2 == 0 {
case true:
    print("짝수")
case false:
    print("홀수")
}

var test = 10
switch test {
case 10:
    print("test11")
    fallthrough
case 11:
    print("test22")
    fallthrough
default:
    print("test333")
}

var age = 100

if age >= 1, age <= 100 {
    print("Update")
}

func update(age: Int) {
    switch age {
    case 1...100:
        print("Update")
    default:
        break
    }
}

if 1...100 ~= age {
    print("update")
} else {
    print("test")
}

/*:
 ---
 */
/*
 
    for문을 이용하여 3의 10제곱에 대한 결과값을 표현하는 코드 구현
 
*/

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
    // answer = answer * base
}
print("\(base) to the power of \(power) is \(answer)")

/*
 
    for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
 
*/

for num in (1...10).reversed() {
    print(num, terminator: "")
}
print()

/*
    2와
 */

/*:
 ---
 */

/*
    Exervise
*/

// 1.
func inputGrade(grade: Double) -> String {
    switch grade {
    case 4.0...4.5:
        return "A+"
    case 3.5...3.9:
        return "A"
    case 3.0...3.4:
        return "B+"
    default:
        return "F"
    }
}

print(inputGrade(grade: 3.5))
print(inputGrade(grade: 3.2))

// 2.

func specMonth(_ month: Int) -> String {
    switch month {
    case 1:
        return "Jan"
    case 2:
        return "Feb"
    case 3:
        return "Mar"
    case 4:
        return "Apr"
    case 5:
        return "May"
    case 6:
        return "Jun"
    case 7:
        return "Jul"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Nov"
    case 12:
        return "Dec"
    default:
        return "날짜를 다시 입력해주세요"
    }
}
specMonth(11)

// 3.
func threeNumber2(_ number:(Int, Int, Int)) -> Bool {
    var result = 0
    result = number.0 *  number.1 * number.2
    
    return result > 0 ? true : false
    
}

threeNumber2((2,-2,2))

// 4.

func yearChk(_ year: Int) -> String {
    
    /*if year % 4 == 0 {
     if year % 100 == 0 {
     guard year % 400 != 0 else {
     return "윤년입니다."
     }
     return "윤년이 아닙니다."
     }
     return "윤년입니다."
     } else {
     return "윤년이 아닙니다."
     }*/
    
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) {
        return "윤년입니다."
    } else {
        return "윤년이아닙니다."
    }
}
print(yearChk(4))
print(yearChk(8))
print(yearChk(800))
print(yearChk(200))
print(yearChk(2400))
print(yearChk(2019))
print(yearChk(3100))

// 5.
func factorial(num: Int) -> Int {
    
    var total: Int = num
    if num == 0 {
        return 1
    }
    
    total *= factorial(num: num-1)
    
    return total
    
}

factorial(num: 5)

// 6.

func twoNumber(_ number:(Int, Int)) -> Int {
    var result = 1
    
    var firstNum = number.0
    var secNum = number.1
    
    for _ in 1...secNum {
        result *= firstNum
    }
    
    return result
    
}

print(twoNumber((4, 2)))

// 7.
// 1. 옵셔널을 이용한 방식
func sumReturn(_ num: Int) {
    var changeNum: String = String(num)
    
    var total = 0
    
    for i in changeNum {
        print(i)
        let temp = String(i)
        total += Int(temp)!
    }
    print("Total = ", total)
    
}
sumReturn(3018)

// 2. 숫자를 나누기와 몫을 이용한 방식
//

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
