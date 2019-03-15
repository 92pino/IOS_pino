import UIKit

/*
 
    열거형
 
    enum 열거형 이름 {
        //열거형의 멤버 정의
        case 멤버값 1
        case 멤버값 2
        case ...
    }
*/

enum Movement: Int {
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}

let aMovement = Movement.left

switch aMovement {
    case .left:
        print("left")
    default: ()
}

if case .left = aMovement {
    print("left")
}

if aMovement == .left {
    print("left")
}

enum House: String {
    case baratheon = "Our is the Fury"
    case Greyjoy = "We Don't Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}
