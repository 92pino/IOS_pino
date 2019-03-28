//: [Previous](@previous)
/*:
 # Exercise
 */

/*:
 ---
 ## Conditional Statements
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb")
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수 (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 - 정수를 입력받아 윤년인지 아닌지 판단하는 함수 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ---
 */
/*:
 ---
 ## Loops
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수 (팩토리얼 :  5! = 5 x 4 x 3 x 2 x 1)
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수 (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수 (1234 인 경우 각 자리 숫자를 합치면 10)
 ---
 */
/*:
 ---
 ## Control Transfer
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 ---
 */

//: [Next](@next)


func q01(_ num: Double) -> String {
    
    var num = num
    
    switch num {
    case 4.5:
        return "A+"
    case 4:
        return "A"
    case 3.5:
        return "B+"
    case 4:
        return "B"
    default:
        return "F"
    }
}
print(q01(3.5))

func q02(_ num: Int) -> String {
    switch num {
    case 1:
        return "1월"
    case 2:
        return "2월"
    case 3:
        return "3월"
    case 4:
        return "4월"
    case 5:
        return "5월"
    case 6:
        return "6월"
    case 7:
        return "7월"
    case 8:
        return "8월"
    case 9:
        return "9월"
    case 10:
        return "10월"
    case 11:
        return "11월"
    case 12:
        return "12월"
    default:
        return "잘못된 월입니다."
    }
}
print(q02(13))

func q03(_ num01: Int, _ num02: Int, _ num03: Int) -> Bool {
    var total = 0
    total = num01 * num02 * num03
    if total > 0 {
        return true
    } else {
        return false
    }
}
q03(1, -3, 2)

// 정수를 입력받아 윤년인지 아닌지 판단하는 함수 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
func q04(_ num: Int) {
    if (num % 4 == 0) && (num % 100 != 0) || (num % 400 == 0) {
        print("윤년입니다.")
    } else {
        print("윤년이 아닙니다.")
    }
}
q04(2019)

func q05(_ num: Int) -> Int {
    var result = 1
    for i in 1...num {
        result *= i
    }
    return result
}
q05(3)

// 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수 (2, 5 를 입력한 경우 결과는 2의 5제곱)

func q06(_ num01: Int, _ num02: Int) -> Int {
    var result: Int = 1
    
    for _ in 1...num02 {
        result = result * num01
    }
    
    return result
}
q06(3, 5)

// 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수 (1234 인 경우 각 자리 숫자를 합치면 10)
func q07(_ num: Int) -> Int {
    var result = 0
    var total = 0
    var num = num
    
    while num > 0 {
        result = num % 10
        total += result
        num /= 10
    }
    
    return total
}
print(q07(12))

// 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되, 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
func q08(_ num: Int) -> Int {
    var total = 0
    for i in 0...num - 1 {
        total += i
        if total > 2000 {
            break
        }
    }
    return total
}
q08(64)

func q09() {
    var result = 0
    for i in 1...50 {
        if 20...30 ~= i {continue}
        result += i
        
    }
    print(result)
}
q09()
