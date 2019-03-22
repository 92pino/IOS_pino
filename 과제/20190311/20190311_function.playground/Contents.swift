import UIKit

/*
 
    [ 과제 ]
    - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
    - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
    - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
    - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
    - 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
    - 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 
*/

/*
 쉬움 ~ 보통
 */

// 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func introMySelf(name: String, age: Int) -> String {
    return "저는 \(name)이고, 나이는 \(age)살 입니다."
}
print(introMySelf(name: "Pino", age: 28))

// 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func returnTrueFalse(num: Int) -> String {
    
    if num % 2 == 0 {
        return "2의 배수입니다."
    } else {
        return "2의 배수가 아닙니다."
    }

}
print(returnTrueFalse(num: 10))
print(returnTrueFalse(num: 11))

// 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func returnMultiply(num1: Int, num2: Int = 10) -> Int {
    return num1 * num2
}
print(returnMultiply(num1: 10))

// 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func testAvg(avg: Int...) -> String {
    var total = 0
    
    for sum in avg {
        total += sum
    }
    
    return "4과목의 평균 값은 \(total / avg.count)점 입니다."
}
 print(testAvg(avg: 80, 70, 50, 100))

// 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
// 숫자를 입력 받을 경우
func totalGrades (grade: Int) -> String {
    switch grade {
    case 90...100 :
        return "A학점"
    case 80...90 :
        return "B학점"
    case 70...80 :
        return "C학점"
    default:
        return "F학점"
    }
}
totalGrades(grade: 50)
totalGrades(grade: 80)

// 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func avgGrades (grade: Int...) -> String {
    var total = 0
    
    for sum in grade {
        total += sum
    }
    
    let avg = total / grade.count
    print(avg)
    
    switch avg {
    case 90...100 :
        return "A학점"
    case 80...90 :
        return "B학점"
    case 70...80 :
        return "C학점"
    default:
        return "F학점"
    }
    
}
print(avgGrades(grade: 80, 50, 70, 90, 90, 100))
