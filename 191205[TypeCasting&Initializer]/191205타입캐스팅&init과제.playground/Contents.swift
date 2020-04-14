import UIKit

var str = "Hello, playground"

/******************
** Type Casting **
******************/

// [ 과제 ]
// 1.
 func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
 }
 let task1: Any = addTwoValues(a: 2, b: 3)
// 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
//task1 + task1

if let take3 = (task1 as? Int) {
    take3 + take3
    print(take3)
}
(task1 as! Int) is Int
let task2 = (task1 as! Int)
task2 + task2


//[ 도전 과제 ]
//1.
let task4: Any = addTwoValues
type(of: task4)
//과제 1번에 이어 이번에는 위와 같이 정의된 task4 변수에 대해
//두 변수의 더하기 연산이 제대로 동작하도록 할 것

// let ttt = (task4 as! (Int) -> Int)ghgfhj


if let take5 = (task4 as? (Int, Int) -> Int) {
    let take6 = take5(1, 2)
    take6 + take6
    }
//(addTwoValues의 각 파라미터에는 원하는 값 입력)
//task2 + task2



//2.
class Car {}
let values: [Any] = [ 0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]

//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

//if values[0] is Int {
//    "int"
//} else {
//    "Babooo"
//}
print("---------문제2--------")
//if let values1 = values[0] as? Int {
//    print(values1)
//}
type(of: values[0])
type(of: values[1])
type(of: values[2])
type(of: values[3])
type(of: values[4])
type(of: values)
values.count

if let values1 = values[0] as? Int {
    print("values의 1번 값은 \(values1)")
}else if let values2 = values[1] as? Double {
    print("values의 2번 값은 \(values2)")
}

for value1 in values {
 print(value1)
}

for value in values {
    switch value {
    case let x where x is Int://x as? Int != nil:
        print(x)
    case let x where x is Double:
        print(x)
    case let x where x is (Double, Double):
        print(x)
    case let x where x is Car:
        print(x)
    case let x where x is ((String) -> Int):
        print(x)
    default:
        break
    }
}


let avv = { (str: String) -> Int in str.count }
avv("321435")

for value in values {
    print(value)
}


//*****************
//** Initializer **
//*****************
///[ 과제 ]
///1. 생성자 구현
///- Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가

class Vehicle {
  let name: String
    var maxSpeed: Int
    
    
    init() {
        self.name = "eunyoung"
        self.maxSpeed = 90
    }
}

///- Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
class Car1: Vehicle {
  var modelYear: Int
  var numberOfSeats: Int
    

    init?(modelYear: Int, numberOfSeats: Int) {
        guard modelYear < 0 && numberOfSeats < 0 else {
            return nil
        }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
    }
}

var car11 = Car1(modelYear: 10, numberOfSeats: 10)
car11?.modelYear

///- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
class Bus: Vehicle {
  let isDoubleDecker: Bool

    override init() {
        self.isDoubleDecker = true
        super.init()
    }

    convenience init(maxSpeed: Int) {
        self.init(maxSpeed: 100)
    }
}

//class Vehicle {
//  let name: String
//    var maxSpeed: Int
//
//    init() {
//        self.name = "eunyoung"
//        self.maxSpeed = 168
//    }
//}


