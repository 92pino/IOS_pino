import UIKit

var startNum: Int = 1
var loop:Int = 9
var endNum: Int = 9

for row in startNum+1...endNum {
    for loop in startNum...endNum {
        print("\(row) X \(loop) = \(row * loop)")
    }
}
