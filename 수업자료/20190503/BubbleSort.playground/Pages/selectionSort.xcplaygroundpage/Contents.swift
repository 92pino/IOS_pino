//: [Previous](@previous)

import Foundation

var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]

func selectionSort(input: inout [Int]) {
  
  // input.indices == 0..<input.count
  for i in input.indices {
    var minIndex = i
    for idx in (i + 1)..<input.count {
      guard input[minIndex] > input[idx] else { continue }
      minIndex = idx
    }
    print(minIndex)
    input.swapAt(i, minIndex)
  }
}

selectionSort(input: &input)
print(input)


//: [Next](@next)
