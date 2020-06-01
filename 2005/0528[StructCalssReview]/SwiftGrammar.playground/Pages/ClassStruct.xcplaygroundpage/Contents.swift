

import Foundation

print("\n-------- [저장프로퍼티] --------\n")

class OnCreat {
  init() {
    print("OnCreat!")
  }
}

class LazyTest {
  var base = 0
  lazy var late = OnCreat()
  
  init() {
    print("Lazy Test")
  }
}

let lz = LazyTest()
lz.late


class PropertyInit {
  
  // 저장프로퍼티 - 인스턴스 생성 시 최초 한번만 실행
  var value01: String = {
    print("value01 execute")
    return "value01"
  }()
  
  var value02: String = {
    print("value02 execute")
    return "value02"
  }()
  
  lazy var value03: String = {
    print("value03 execute")
    return "value03"
  }()
}

let s = PropertyInit()

//s.value01
//s.value01 = "dd?"
//s.value01
s.value01
s.value03
s.value03

print("\n-------- [연산 프로퍼티] --------\n")

/****************************************
 * 다른프로퍼티에 의존적일때
 * 특정 연산을 통해 얻을 수 있는 값을 정의할 때
 *
 
 ****************************************/


struct UserInfo {
  // 저장프로퍼티: 태어난 연도
  var birth: Int!
  
  // 연산프로퍼티: 올해가 몇년도인지 계산
  var thisYear: Int! {
    get {
      let df = DateFormatter()
      df.dateFormat = "yyy"
      return Int(df.string(from: Date()))
    }
  }
  
  // 연산프로퍼티: 올해 - 태어난연도 + 1
  var age: Int {
    get {
      return (self.thisYear - self.birth) + 1
    }
  }
}

let info = UserInfo(birth: 1980)
print(info.age)


struct Rect {
  
  // 사각형이 위치한 기준 좌표(좌측 상단 기준)
  var originX: Double = 0.0, originY: Double = 0.0
  
  // 가로 세로 길이
  var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
  
  // 사각형의 X 좌표 중심
  var centerX: Double {
    get {
      return self.originX + (sizeWidth / 2)
    }
    set(newCenterX) {
      originX = newCenterX - (sizeWidth / 2)
    }
  }
  
  // 사각형의 Y좌표 중심
  var centerY: Double {
    get {
      return self.originY + (self.sizeHeight / 2)
    }
    set(newCenterY) {
      self.originY = newCenterY - (self.sizeHeight / 2)
    }
  }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0); print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")

//let aa = square.centerX = 90


struct Position {
  var x: Double
  var y: Double
}
struct Size {
  var width: Double = 0.0
  var height: Double = 0.0
}

struct Rect01 {
  
  // 좌표
  var origin: Position = Position(x: 0.0, y: 0.0)
  // 가로세로길이
  var size = Size()
  // x좌표중심
  var center: Position {
    get {
      let centerX = self.origin.x + (self.size.width / 2)
      let centerY = self.origin.y + (self.size.height / 2)
      return Position(x: centerX, y: centerY)
    }
    set(gg) {
      self.origin.x = gg.x - (size.width / 2)
      self.origin.y = gg.y - (size.height / 2)
    }
  }
}

let p = Position(x: 20.0, y: 20.0)
let ss = Size(width: 10.0, height: 10.0)

var square01 = Rect01(origin: p, size: ss)
print("square.centerX = \(square01.center.x), square.centerY = \(square01.center.y)")


square01.center = Position(x: 20.0, y: 20.0)
print("square.centerX = \(square01.center.x), square.centerY = \(square01.center.y)")


// 연산프로퍼티가 없는경우 함수로 대체
struct Rect02 {
  
  var origin: Position = Position(x: 0.0, y: 0.0)
  // 가로세로길이
  var size = Size()
  
  func getCenter() -> Position {
    let centerX = self.origin.x + (self.size.width / 2)
    let centerY = self.origin.y + (self.size.height / 2)
    return Position(x: centerX, y: centerY)
  }
  mutating func setCenter(newCenter: Position) {
    self.origin.x = newCenter.x - (size.width / 2)
    self.origin.y = newCenter.y - (size.height / 2)
  }
}


print("\n-------- [프로퍼티 옵저버] --------\n")

/**************************
 값의 변화를 주시하고 있어야 할 때
 값의 변화에 따른 처리가 필요할 때
 **************************/

struct Job {
  var income: Int = 0 {
    willSet(newIncome) {
      print("이번달 월급은 \(newIncome)입니다.")
    }
    didSet {
      if income > oldValue {
        print("월급이 \(oldValue)원 증가했네요. 소득세가 상향조정될 예정입니다.")
      } else {
        print("저런, 월급이 삭감되었군요. 아쉽겠어요.")
      }
    }
  }
}

var job = Job(income: 1000000)
job.income = 2000000
job.income = 1900000


print("\n-------- [type property] --------\n")

/**************************
 * 인스턴스를 생성하지 않고 클래스나 구조체 자체에 값을 저장
 * 모든 인스턴스가 하나의 값을 공용으로 사용
 * 클레스,구조체,열거형에서 모든 인스턴스들이 공유해야하는 값을 정의할 때
**************************/

struct Foo {
  //타입 저장 프로퍼티
  static var sFoo = "구조체 타입 프로퍼티 값"
  //타입 연산 프로퍼티
  static var cFoo : Int {
    return 1
  }
}

class Boo {
  //타입 저장 프로퍼티
  static var sFoo = "클래스 타입 프로퍼티 값"
  //타입 연산 프로퍼티
  static var cFoo: Int {
    return 10
  }
  // 재정의가 가능한 타입 연산 프로퍼티
  class var oFoo: Int {
    return 100
  }
}

print(Foo.sFoo)
Foo.sFoo = "새로운 값"
print(Foo.sFoo)

print(Boo.sFoo)
print(Boo.cFoo)
//print(Boo.cFoo =)



print("\n-------- [인스턴스 메소드] --------\n")

struct Resolution {
  var width = 0
  var heigh = 0
  
  //구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
  func desc() -> String {
    let desc = "이 해상도는 가로 \(self.width) * 세로 \(self.heigh)로 구성됩니다."
    return desc
  }
}

class VideoMode {
  var resolution = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
  
  //클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
  func desc() -> String {
    if self.name != nil {
      let desc = "이\(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
      return desc
    } else {
      let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
      return desc
    }
  }
}


class Counter {
  
  var count = 0
  
  func increment() {
    self.count += 1
  }
  
  func incrementBy(amount: Int) {
    self.count += amount
  }
  
  func reset() {
    self.count = 0
  }
}

let counter = Counter()
counter.count
counter.increment()
counter.incrementBy(amount: 6)
counter.count
counter.reset()
counter.count


// 구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티의 값을
// 수정할땐 반드시 mutating을 사용해서 내부 프로퍼티 값을 수정하는
// 메소드라는 것을 컴파일러에 알려주어야 한다.
struct Point {
  
  var x = 0.0, y = 0.0
  mutating func moveByX(x deltaX: Double, y deltaY: Double) {
    self.x += deltaX
    self.y += deltaY
  }
}

var point = Point(x: 10.5, y: 12.0)
point.x = 5
point.y = 4
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다")

class Fooo {
  // 타입 메소드 선언
  class func fooTypeMethod() {
    // 타입메소드의 구현내용이 들어감
    print("바로사용이 가능하다옹")
  }
}

let ffff = Fooo()
//ffff.foo
Fooo.fooTypeMethod()


print("\n-------- [오버라이딩] --------\n")

print("\n-------- [타입캐스팅] --------\n")

print("\n-------- [초기화 구문] --------\n")

print("\n-------- [옵셔널 체인] --------\n")


//: [Next](@next)
