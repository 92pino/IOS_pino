import UIKit

var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]

/*
 ## inout
 >
*/
func bubbleSort(input: inout [Int]) {
  
  // input이 비어있을 경우 return
  guard !input.isEmpty else { return }
  
  // [5, 6, 1, 3, 10, 2, 7, 14, 9]
  for i in 1..<input.count {
    
    var isSorted = true
    
    for idx in 0..<input.count - i {
      guard input[idx] > input[idx + 1] else { continue }
      input.swapAt(idx, idx + 1)
      print("\(i):", input)
      
//      let temp = input[idx]
//      input[idx] = input[idx + 1]
//      input[idx + 1] = temp
      
      isSorted = false
    }
    
    guard !isSorted else { break }
  }
  

}

bubbleSort(input: &input)
print(input)
