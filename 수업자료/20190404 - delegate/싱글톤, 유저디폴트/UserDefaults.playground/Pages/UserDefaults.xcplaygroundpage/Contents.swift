//: [Previous](@previous)
import Foundation
/*:
 # UserDefaults
 - iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
 - 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장
 */


// Memory
var inMemory = 10
inMemory
/*:
 ---
 ### Question
 - 메모리와 파일로 저장하는 형태의 차이점은?
    - 메모리에 저장할 경우 ==> 실행이 끝나면 메모리에서 사라짐
    - 파일로 저장할 경우  ==> 프로그램을 종료했다가 다시 실행시켜도 데이터를 파일로부터 읽어올수 있다.
 ---
 */


// UserDefaults 는 일반적으로 싱글톤 형태로 사용
let newUserDefaults = UserDefaults()
let singletonUserDefaults = UserDefaults.standard

// 파일에 10을 Ten이라는 키값으로 저장
UserDefaults.standard.set(10, forKey: "Ten")
UserDefaults.standard.integer(forKey: "Ten")

// 파일에 3.14를 Double Pi이라는 키값으로 저장
UserDefaults.standard.set(3.14, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi")

// 파일에 true를 True라는 키값으로 저장
UserDefaults.standard.set(true, forKey: "True")
UserDefaults.standard.bool(forKey: "True")

let date = Date()

// 모든 타입을 할당해줄수 없으므로 date같은 경우 Any? 타입 형태로
UserDefaults.standard.set(date, forKey: "Date")
UserDefaults.standard.object(forKey: "Date")

//Q. 저장하지 않은 키를 불러올 때 결과는?
// option 키 잘 활용 해야될것!!! || quickHelp 자주 볼것
UserDefaults.standard.integer(forKey: "WrongKey") // 0
UserDefaults.standard.bool(forKey: "WrongKey")    // false
UserDefaults.standard.object(forKey: "WrongKey")  // optional이어서 nil값 return



let userDefaults = UserDefaults.standard
print(userDefaults)

print("\n---------- [ dictionaryRepresentation ] ----------\n")
print(userDefaults.dictionaryRepresentation())

print("\n---------- [ keys ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().keys))

print("\n---------- [ values ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().values))


//: [Next](@next)
