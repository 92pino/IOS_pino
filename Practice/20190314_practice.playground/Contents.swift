import UIKit

/*
[ 과제 ]
        - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
        ex) 123 -> 321 , 10293 -> 39201

        - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
        ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

        - 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
        ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

        - 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
        enum Arithmetic {
            case addition, subtraction, multiplication, division
        }
        func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
            // 코드
        }

        - 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
            + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 */

// 1.
// optional
func reverse(_ num: Int) -> Int {
    let result = String(String(num).reversed())
    return Int(result)!
}
reverse(242315)

// 반복문 사용
func reverseNum(num: Int) ->Int{
    var result = 0
    var throwNum = num
    while throwNum > 0 {
        result *= 10
        print(result)
        result += throwNum % 10
        throwNum = throwNum / 10
    }
    return result
}
reverseNum(num: 123)

// 2.



var arr = ["a", "b", "c", "a", "e", "d", "c"]

func nonRepeatArr(_ arr: [String]) -> [String]{
    var arr = arr
    var result: [String] = []
    
    for i in 0...arr.count - 1 {
        var cnt = 0
        for j in 0...arr.count - 1 {
            if i == j {
                continue
            }
            
            if arr[i] == arr[j] {
                cnt += 1
            }
        }
        if cnt == 0 {
            result.append(arr[i])
        }
    }
    return result
}

nonRepeatArr(arr)

// Dictionary 사용
func printUniqueValue2(from arr: [String]){
    var dict: [String : Int] = [:]
    
    for str in arr {
        if let num = dict[str] {
            dict[str] = num + 1
        } else {
            dict[str] = 1
        }
    }
    print(dict)
    var result: [String] = []
}

printUniqueValue2(from: arr)

// 3. 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수

let randomArr = [2, 8, 7, 1, 4, 3, 12]

func oddEven(_ array: [Int]) -> [Int] {
    var arr: [Int] = []
    for i in array {
        if i % 2 != 0 {
            arr.insert(i, at:0)
        } else {
            arr.append(i)
        }
    }
    return arr
}
oddEven(randomArr)

// - 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현

enum Arithmetic {
    case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    switch op {
    case .addition:
        return operand1 + operand2
    case .subtraction:
        return operand1 - operand2
    case .multiplication:
        return operand1 * operand2
    case .division:
        return operand1 / operand2
    }
}
calculator(operand1: 10, operand2: 20, op: .addition)
calculator(operand1: 10, operand2: 20, op: .subtraction)
calculator(operand1: 10, operand2: 20, op: .multiplication)
calculator(operand1: 10, operand2: 20, op: .division)

// 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고

var animalDic = ["식육목":
    [
        "개과" :
        [
            "개" : ["자칼", "늑대", "북미산 이리"],
            "여우" : ["아메리카 여우", "유럽 여우"]
        ],
        "고양이과" :
        [
            "고양이" : ["고양이", "살쾡이"],
            "표범" : ["사자", "호랑이"]
        ]
    ]
]

if let chkAnimal = animalDic["식육목"] {
    if let chkAnimal2 = chkAnimal["고양이과"] {
        if let chkAnimal3 = chkAnimal2["표범"] {
            print(chkAnimal3[0], chkAnimal3[1])
        }
    }
}

let stringValue: String = "L"
