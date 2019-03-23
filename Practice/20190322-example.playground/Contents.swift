import UIKit
/*
[ 연습 문제 ]
# 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

# 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
e.g.  123 -> 6 ,  5678 -> 26

# 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

# 하샤드 수 구하기
- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.

# 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
e.g.  Input : 6, 9   ->  Output : 18, 3

// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
*/

func sum01(_ getInt: Int) {
    var defaultValue: Int = 1
    var result = 0
    
    if defaultValue > getInt {
        var arr = getInt ... defaultValue
        for i in getInt...defaultValue {
            result += i
        }
        print(result)
    } else if defaultValue < getInt {
        var arr = defaultValue ... getInt
        for i in 0...arr.count {
            result += i
        }
        print(result)
    }
    
}
sum01(-3)
sum01(9)

func sayHello(name: String, age: Int) {
    print("\(name), \(age)")
}
sayHello(name: "Pino", age: 10)

func sayHello(_ name: String, age: Int) {
    print("\(name), \(age)")
}

sayHello("name: Pino", age: 10)
