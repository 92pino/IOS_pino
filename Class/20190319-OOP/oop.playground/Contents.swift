import UIKit

/*
    값 타입 Value Type == Struct, Enum, Int (구조체)
    참조 타입 Reference Type == Class (클래스)
 
    // 메모리에 대해 공부 필요
    메모리의 종류 : Code, Data, Heap, Stack
 
 
 
*/

class Car {
    var model: String?
    var modelYear: Int?
    var color: String?
    
    init() {
        model = ""
        modelYear
        color = ""
    }
    
    func drive(){
        print("운전하기")
    }
    func reverse(){
        print("후진하기")
    }
}
let dreamCar = Car()
dreamCar.model = "Ferrai"
dreamCar.modelYear = 2019
dreamCar.color = "Black"
dreamCar.drive()
dreamCar.reverse()
