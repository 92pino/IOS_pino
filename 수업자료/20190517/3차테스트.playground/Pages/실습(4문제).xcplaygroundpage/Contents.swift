import Foundation

/***************************************************
 < 1번 문제 >
 손님, 바리스타, 커피 클래스를 각각 정의하고
 손님이 바리스타에게 커피를 주문하는 기능 구현하기
 
 [ Class ]
 ** 손님 (Customer)
 - 필수 속성: 이름(name)
 - 필수 메서드: 주문하기( func order(menu: CoffeeMenu, to barista: Barista) )
 
 ** 바리스타 (Barista)
 - 필수 속성: 이름(name)
 - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
 
 ** 커피 (Coffee)
 - 필수 속성: 이름(name), 가격(price)
 
 [ Enumeration ]
 ** 커피 메뉴 (CoffeeMenu)
 - case: americano, latte, cappuccino
 
 e.g.
 let customer = Customer(name: "손님A")
 let barista = Barista(name: "바리스타A")
 customer.order(menu: .americano, to: barista)
 
 Output: 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
 ***************************************************/

print("\n---------- [ 1번 문제 ] ----------\n")
class Customer {
    let name: String = ""
}

class Barista {
    let name: String = ""
}

enum CoffeeMenu {
    let americano
    let latte
    let cappuccino
}

//let customer = Customer(name: "손님A")
//let barista = Barista(name: "바리스타A")
//customer.order(menu: .americano, to: barista)

// 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.


/***************************************************
 < 2번, 3번 문제 >
 문제를 읽고 두 가지 서로 다른 방식으로 구현해보기
 2번 문제: 아래 내용을 Dictionary를 이용해 구현하기
 3번 문제: 아래 내용을 Array를 이용해 구현하기
 
 문제:
 주어진 숫자에 대해 10의 숫자 단위로 그룹으로 묶고, 각 그룹의 데이터는 해당 범위 내의 숫자들로 구성
 
 Input 1: Array(1...100)
 Input 2: [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]
 Output:
 아래와 동일한 형식으로 출력하며, 그룹의 숫자는 오름차순으로 출력되어야 함.
 값이 하나도 없는 그룹은 제외하고 출력
 
 e.g.
 1) Input 1 일 때
 Group: 0  -  Value: [1, 2, 3, 4, 5, 6, 7, 8, 9]
 Group: 1  -  Value: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
 ....
 Group: 10  -  Value: [100]
 
 2) Input 2 일 때 - 값이 하나도 없는 그룹은 제외하고 출력
 Group: 0  -  Value: [0, 3, 9]
 ...
 Group: 4  -  Value: [41, 49]
 Group: 9  -  Value: [90, 98]
 ***************************************************/

let data1 = Array(1...100)
let data2 = [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]

/***************************************************
 2번 문제 - Dictionary를 이용해서 구현
 ***************************************************/

print("\n---------- [ 2번 문제 ] ----------\n")




/***************************************************
 3번 문제 - Array를 이용해서 구현
 ***************************************************/

print("\n---------- [ 3번 문제 ] ----------\n")





/***************************************************
 < 4번 문제 > 고차함수만을 이용하여 구현
 1)
 1부터 100까지의 숫자를 가진 배열에서 홀수만을 골라 각 숫자에 1씩 더해준 배열을 출력
 Output: [2, 4, 6, 8, 10, 12, ... 98, 100]
 
 2)
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 위 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그것을 제곱한 숫자들을 모두 더한 결과 출력
 Output: 55
 ***************************************************/

print("\n---------- [ 4번 문제 ] ----------\n")

var func01: [Int] = Array(1...100)

var func01Result = func01.filter { $0 % 2 != 0 }.map { $0 + 1 }
print(func01Result)

var func02 = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
var func02Result = func02.map { Int($0) ?? 0 }.reduce(0) { $0 + ($1 * $1) }
print(func02Result)


/***************************************************
 수고하셨습니다!
 ***************************************************/



