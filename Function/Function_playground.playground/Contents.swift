import UIKit

//func 함수이름(매개변수1: 타입, 매개변수2: 타입, ...) -> 반환타입 {
//    실행내용
//    return 반환값
//}

// 반환값이 없을 경우
//func 함수명 (매개변수1: 타입, 매개변수2: 타입, ...){
//    실행 내용
//}

// 1. 매개변수와 반환값이 모두 없는 함수
func printHello() {
    print("안녕하세요")
}

// 함수 호출
printHello()
// 안녕하세요

// 2. 매개변수가 없지만 반환값은 있는 함수
func sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

// 3. 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String){
    print("\(name)님, 안녕하세요.")
}

// 함수 호출
// 매개변수를 가지고 있는 함수는 호출할 때 괄호 안에 인자값을 넣어 호출 (인자값 == 매개변수 타입)
let inputName:String = "pino"
printHelloWithName(name: inputName)
// pino님, 안녕하세요

// 인자값이 있는 함수를 호출할 때에는 인자값 앞에 기본적으로 인자 레이블을 붙여서 호출 (생략시 컴파일 오류)
func incrementBy(amount: Int, numberOfTimes: Int){
    var count = 0
    count = amount * numberOfTimes
}
// incrementBy 함수 호출 시 amout, numberOfTimes 인자 레이블 붙여서 호출
incrementBy(amount: 5, numberOfTimes: 2)

func times(x: Int, y: Int) -> Int {
    return (x * y)
}
times(x: 5, y: 10)  // 함수의 이름만으로 호출한 구문
times(x:y:)(5, 10)  // 함수의 식별자를 사용하여 호출한 구문


// 4. 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String { // 반환값으로 사용된 returnValue의 타입과 반환 타입인 String이 같아야한다.
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}

// 반환값이 없는 함수일 경우 return은 함수의 실행을 명시적으로 종료할 목적
// ex)
func hell(name: String?){
    guard let _name = name else {
        return
    }
    
    print("\(_name)님, 안녕하세요")
}

// 함수는 반드시 하나의 값만을 반환
// 여러 개의 값을 반환해야 한다면 딕셔너리, 배열, 튜플, 구조체, 클래스와 같은 집단 자료형에 담아 반환

//func getIndvInfo() -> (Int, String){
//    let height = 180
//    let name = "pino"
//
//    return(height, name)
//}

// 3개 이상의 값으로 구성된 튜플
//func getUserInfo() -> (Int, Character, String){
//    let gender: Character = "M"
//    let height = 180
//    let name = "pino"
//
//    return (height, gender, name)
//}
//var uInfo = getUserInfo()
//uInfo.0

// 튜플 요소 각각을 변수로 직접 받기
//var (a, b, c) = getUserInfo()
//a
//b
//c

// 특정 튜플이 여러 곳에서 사용될 경우 타입 알리어스(typealias)를 통해 새로운 축약형 타입을 정의
// typealias <새로운 타입 이름> = <타입 표현>

typealias infoResult = (Int, Character, String)

func getUserInfo() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "pino"
    
    return (height, gender, name)
}
let info = getUserInfo()
info.0

// 매개변수
// 외부 매개변수 : 함수를 호출할 때 인자값에 대한 레이블 역할, 함수의 식별자 일부로 사용
// 내부 매개변수 : 입력된 인자값을 함수 내부에서 참조하기 위해 사용

func printHello(_ name: String, _ msg: String){
    print("\(name)님, \(msg)")
}

printHello(_: "pino", "안녕하세요")

// ** 질문사항 **
// 외부 매개변수가 사용될 자리에 언더바가 들어갔을경우 함수명 매개변수 자리에 언더바를 넣는 이유? (생략은 해도 되지 않는지)


// 가변 인자
// 가변적인 개수의 인자값을 입력받아야 할 때 ... 연산자 추가
// func 함수 이름(매개변수명: 매개변수 타입...)
func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}

print(avg(score:10,20,30,40))
