import UIKit

/*
    값 타입 Value Type == Struct, Enum, Int (구조체)
    참조 타입 Reference Type == Class (클래스)
 
    // 메모리에 대해 공부 필요
    메모리의 종류 : Code, Data, Heap, Stack
 
 
 
*/

class Car {
    var model: String
    var modelYear: Int
    var color: String
    
    init(model: String, modelYear: Int, color: String) {
        self.model = model
        // 클래스 내 model = 외부 객체
        self.modelYear = modelYear
        self.color = color
    }
    
    func drive(){
        print("운전하기")
    }
    func reverse(){
        print("후진하기")
    }
}
let dreamCar = Car(model: "Ferarri", modelYear: 2019, color: "Black")
dreamCar.drive()
dreamCar.reverse()
dreamCar.model
dreamCar.modelYear
dreamCar.color

/***************************************************
 1. width, height 속성을 가진 Quadrangle 클래스 정의
 2. 초기화 메서드에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형의 가로세로 길이  /  사각형의 넓이를 반환하는 메서드를 각각 구현
 5. 다음과 같은 속성을 지닌 인스턴스 생성
 
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 ***************************************************/

class Quadrangle {
    var width: Double?
    var height: Double?
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func rec() -> String {
        return "사각형의 가로 길이는 : \(width!), 세로 길이는 : \(height!), 사각형의 넓이는 \(width! * height!)"
    }
}

let square01 = Quadrangle(width: 10, height: 5)
let square02 = Quadrangle(width: 7, height: 7)
print(square01.rec())
print(square02.rec())

/***************************************************
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 및 변경 가능한 메서드 구현
 3. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 ***************************************************/

class TV {
    var channel: Int?
    var volume: Int?
    var power: String?
    var off: Int = -1
    
    init(channel: Int, volume: Int, power: String){
        self.channel = channel
        self.volume = volume
        self.power = power
    }
    
    func currentSetting() -> String {
        if power == "off" {
            tv.channel == channel
            return "-1"
        } else {
            return "현재 채널 : \(channel!), 현재 볼륨 : \(volume!)"
        }
    }
}

let tv = TV(channel: 3, volume: 2, power: "off")
tv.channel = 10
print(tv.channel)
print(tv.currentSetting())
