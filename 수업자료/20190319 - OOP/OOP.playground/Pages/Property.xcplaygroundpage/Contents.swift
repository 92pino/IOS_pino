//: [Previous](@previous)
import Foundation
/*:
 # Property
 */
/*:
 ---
 ## Stored Property
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
class StoredProperty {
  var width = 0.0
  var height = 0.0
}

let stored = StoredProperty()
type(of: stored)
stored.width = 123
stored.height = 456
stored.width
stored.height

/*:
 ---
 ## Lazy Stored Property
 - 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
 - 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
 - 필요한 경우가 제한적일 때
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ---
 */
print("\n---------- [ Lazy Property ] ----------\n")

class BasicStoredProperty {
  var width = 10.0
  var height = 20.0
  
  var area = 200.0
//  var area = self.width * self.height
}

let basicStored = BasicStoredProperty()
basicStored.area
basicStored.width = 30
basicStored.area



class LazyStoredProperty {
  var width = 10.0
  var height = 20.0
  
  // 1. 외부 요인이나 다른 설정에 기반
//  var area = self.width * self.height
  lazy var area = width * height
  
  // 2. 계산 비용이 많이 드는 상황
//  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
  
  // 3. 필요한 경우가 제한적인 상황
//  func ifStatement() {
//    if true {   // 10%
//      print(area)
//    } else {    // 90%
//      print(width)
//    }
//  }
    
    // 2, 3번의 상황같은 경우 메모리 , 퍼포먼스관련 부분을 최적화 하기 위해 lazy 사용
}

let lazyStored = LazyStoredProperty()
lazyStored.width = 30
lazyStored.area


// 순서 주의
let lazyStored1 = LazyStoredProperty()
lazyStored1.area    // 이미 한번 값 저장 10 * 20 = 200
lazyStored1.width = 30
lazyStored1.area    // 이미 값 저장되어서 200


/*:
 ---
 ## Computed Property
 - 자료를 저장하지 않고 매번 호출할 때마다 새로 계산
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ![ComputedProperty](computed.png)

 ---
 */
print("\n---------- [ Computed Property ] ----------\n")

class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
    // lazy area는 직접적으로 값을 바꾸지 않는 이상 초기 결과값을 계속 반환
    // computed는 작성 할 때마다 값을 다시 계산해서 결과값을 반환
  lazy var lazyArea = width * height
  var area: Double {
    return width * height
  }
  
  // Computed + Stored
  private var _koreanWon = 0.0
  var wonToDollar: Double {
    get {
      return _koreanWon / 1136.5
    }
    set {
      _koreanWon = newValue
    }
  }
}

var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area
computed.lazyArea

computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar


/*:
 ---
 ## Property Observer
 - Class ⭕️   Structure ⭕️   Enumeration ❌
 ![property-observer](property-observer.png)
 ---
 */
print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
  var height = 0.0
  
  var width = 0.0 {
    // willSet :
    willSet {
      print("willSet :", width, "->", newValue)
    }
    
    // -------willSet과 didSet 바뀌는 시점------
    
    // didSet :
    didSet {
      height = width / 2
      print("didSet :", oldValue, "->", width)
    }
  }
}

var obs = PropertyObserver()
obs.height
obs.width
obs.height = 456
obs.height
obs.width
obs.width = 123
obs.width
obs.height

/*:
 ---
 ## Type Property
 - Shared
 - Lazily Initialized
 - Class ⭕️   Structure ⭕️   Enumeration ⭕️
 ---
 */
/***************************************************
 선언 - static let(var) <#propertyName#>: <#Type#>
       class var <#propertyName#>: <#Type#> { return <#code#> }
 사용 - <#TypeName#>.<#propertyName#>
 
 static: override 불가
 class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
 ***************************************************/

print("\n---------- [ Type Property ] ----------\n")

class TypeProperty {
  static var unit: String = "cm"
  var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

// TypeProperty는 전체가 공유하는 프로퍼티
TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m"
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")


//: [Next](@next)
