/*:
 ---
 ## 2번 문제 (최종 결과)
 ---
 */
import Foundation

// 1)
func fizzBuzz(N: Int) -> String {
    guard !(N % 3 == 0 && N % 5 == 0) else {
        return "FizzBuzz"
    }
    
    if N % 3 == 0 {
        return "Fizz"
    } else if N % 5 == 0 {
        return "Buzz"
    } else {
        return "\(N)"
    }
}
fizzBuzz(N: 15)

// 2)
func fizzBuzz2(N: Int) -> String {
    switch (N % 3 == 0, N % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (false, false):
        return "\(N)"
    case (true, true):
        return "FizzBuzz"
    }
}

// 3)

let x: ((Int) -> String) = { x in
    switch (x % 3 == 0, x % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (false, false):
        return "\(x)"
    case (true, true):
        return "FizzBuzz"
    }
}

print(x(3))
print(x(15))
print(x(4))

// 4)

print((1...100).map(x))
