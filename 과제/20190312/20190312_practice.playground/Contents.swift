import UIKit

/*
 
 [ 과제 ]
 - 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
 (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
 - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
 - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
 - 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
 (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )
 - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
 
 // 제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
 // 정답 풀이는 목요일 전달
 // 항목별 체감 난이도도 주석으로 같이 적어주세요.
 
*/

// 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
// 쉬움
// 1) 옵셔널값 이용하기
func sumNum(_ num:(Int, Int)) -> Int {
    var temp = 0
    temp = Int(String(num.0) + String(num.1))!
    return temp
}
sumNum((35,40))

// 2)

func sumNum2(_ firstNum: Int, _ secondNum: Int) -> Int {
    var total = firstNum, sec = secondNum
    while sec > 0 {
        sec /= 10
        total *= 10
    }
    return total + secondNum
}
print(sumNum2(127, 34))
print(sumNum2(1302, 50))

// 문자열 두 개를 입력받아 두 문자열이 같으지 여부를 판단해주는 함수
// 쉬움
func twoStr(_ str:(String, String)) -> Bool {
    if str.0 == str.1 {
        return true
    } else {
        return false
    }
}
print(twoStr(("test", "test")))
print(twoStr(("Pino", "Raon")))

// 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
// 쉬움
func divisor(num: Int) -> Int{
    for i in 1...num {
        if num % i == 0 {
            print(i)
        } else {
            continue
        }
    }
    return num
}
divisor(num: 10)

// 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
// 보통
    
func chkNum(number: Int) -> Bool {
    var chk: Bool = true
    
    for num in 2...(number-1) {
        if number % num == 0 {
            chk = false
        }
    }
    return chk
}
chkNum(number: 15)
chkNum(number: 5)

// 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
func fib(_ n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    return fib(n-1) + fib(n-2)  // fib(2) + fib(1) fib(n)
}
fib(3)

// 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
// 쉬움

func commonNum(_ num: Int) -> Int{
    for i in 0...num {
        if i % 3 == 0 && i % 5 == 0 {
            guard i != 0 else {
                continue
            }
            print("공배수는 \(i)")
        } else {
            continue
        }
    }
    return num
}
commonNum(100)
