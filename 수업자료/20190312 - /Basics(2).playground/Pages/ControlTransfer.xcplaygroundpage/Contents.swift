//: [Previous](@previous)
/*:
 # Control Transfer Statement
 - 특정 코드에서 다른 코드로 제어를 이전하여 코드 실행 순서를 변경하는 것
 - Swift 에는 5가지 키워드 사용
   - continue
   - return
   - break
   - fallthrough
   - throw
 */


print("---------- [ continue ] ----------\n")

for num in 0...15 {
  if num % 2 == 0 {
    continue
  }
  print(num)
}

// 결과값은?



print("\n---------- [ return ] ----------\n")

func isEven(num: Int) -> Bool {
  if num % 2 == 0 {
    return true
  }
  return false
}

isEven(num: 1) // false
isEven(num: 2) // true


func returnFunction() -> Int {
  var sum = 0
  
  for _ in 1...100 {
    sum += 20
    return sum
//    return 5
  }
  return 7
}

print(returnFunction())

// 결과값은?



//for i in 1...100 {
//  print(i)
//  break
//}

//for i in 1...100 {
//  print(i)
//  return
//}

// 결과값은?


print("\n---------- [ break 1 ] ----------\n")

for num in 0...8 {
  if num % 2 == 0 {
    break
  }
  print(num)
}

// 결과값은?


print("\n---------- [ break 2 ] ----------\n")

for i in 0...3 {
  for j in 0...3 {
    if i > 1 {
      break
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}

// inner 의 실행 횟수와 outer 의 실행 횟수는?


/*:
 ---
 ## Labeled Statements
 ---
 */
print("\n---------- [ labeled ] ----------\n")

OUTER: for i in 0 ... 3 {
  INNER: for j in 0...3 {
    if i > 1 {
      print("j :", j)
//      continue INNER
      break OUTER
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}

// 결과값은?


//: [Next](@next)
