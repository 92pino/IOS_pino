//: [Previous](@previous)

import Foundation

var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]

func insertionSort(input: inout [Int]) {
  guard !input.isEmpty else { return }
  
  for idx in 1..<input.count {
    let currentValue = input[idx]
    var insertionIdx = idx
    
    for comparisonIdx in (0..<idx).reversed() {
      guard currentValue < input[comparisonIdx] else { break }
      input[comparisonIdx + 1] = input[comparisonIdx]
      insertionIdx = comparisonIdx
    }
    input[insertionIdx] = currentValue
  }
}

insertionSort(input: &input)
print(input)
//: [Next](@next)
