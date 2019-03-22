import UIKit
/*
 
[ 과제 ]
1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기
2. 지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
3. 클로저 Full Syntax <-> Optimized Syntax 변환 연습

// 위 1 ~ 3번은 자율 학습, 4 ~ 5번은 일요일 밤까지 제출
// 제출 : 일요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 월요일 전달

4.
아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool
    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }
    return isAscending
}


let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}



5.
옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수


func combineString(str1: String?, str2: String?, str3: String?) -> String {
    // code
}

// 입력 예시 및 결과
// combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
// combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"

*/

// 4.
/*
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool
    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }
    return isAscending
}


let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}
*/

let someClosure: (String, String) -> Bool = {$0 > $1}

let otherClosure: ([Int]) -> Int = { $0.count }

// 5.

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    return (str1 ?? "") + (str2 ?? "") + (str3 ?? "")
}
print(combineString(str1: "AB", str2: "CD", str3: "EF"))
print(combineString(str1: "AB", str2: nil, str3: "EF"))
