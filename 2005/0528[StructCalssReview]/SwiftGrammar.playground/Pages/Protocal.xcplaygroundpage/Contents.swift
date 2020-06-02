//: [Previous](@previous)

import Foundation
import UIKit

print("\n-------- [Protocol] --------\n")

protocol SomePropertyProtocol {
  var name: String { get set }
  var description: String { get}
}

struct RubyMember: SomePropertyProtocol {
  var name: String = "홍길이"
  
  var description: String {
    return "Name: \(self.name)"
  }
}

protocol SomeMethodProtocol {
  func execute(cmd: String)
  func showProt(p: Int) -> String
}

struct RubyService: SomeMethodProtocol {
  func execute(cmd: String) {
    if cmd == "start" {
      print("Start!")
    }
  }
  
  func showProt(p: Int) -> String {
    return "Port : \(p)"
  }
  
  
}

protocol NewMethodProtocol {
  mutating func execute(cmd command: String, desc: String)
  func showProt(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
  mutating func execute(cmd command: String, desc: String) {
    if command == "start" {
      print("\(desc)is start!")
    }
  }
  func showProt(p: Int, memo desc: String) -> String {
    return "Port: \(p), memo: \(desc)"
  }
}

struct RubyNewService2: NewMethodProtocol {
  mutating func execute(cmd comm: String, desc d: String) {
    if comm == "start" {
      print("\(d)is start")
    }
  }
  
  func showProt(p: Int, memo description: String) -> String {
    return "Port: \(p), memo: \(description)"
  }
  
  
}


print("\n-------- [Delegation] --------\n")

protocol FuelPumpDelegate {
  func lackFuel()
  func fullFuel()
}

class FuelPump {
  
  var maxGage: Double = 100.0
  var delegate: FuelPumpDelegate? = nil
  
  var fuelGage: Double {
    didSet {
      if oldValue < 10 {
        self.delegate?.lackFuel()
      } else {
        self.delegate?.fullFuel()
      }
    }
  }
  init(fuelGage: Double = 0) {
    self.fuelGage = fuelGage
  }
  func startPump() {
    while (true) {
      if (self.fuelGage > 0) {
        self.jetFuel()
      } else {
        break
      }
    }
  }
  func jetFuel() {
    self.fuelGage -= 1
  }
}

class Car: FuelPumpDelegate {
  
  var fuelPump = FuelPump(fuelGage: 100)
  
  init() {
    self.fuelPump.delegate = self
  }
  func lackFuel() {
    // 연료를 보충한다.
  }
  
  func fullFuel() {
    // 연료 보충을 중단한다.
  }
  
  // 자동차에 시동을 건다.
  func start() {
    fuelPump.startPump()
  }
  
}

print("\n-------- [프로토콜의 상속] --------\n")

protocol Machine {
  func join()
}

protocol Wheel: Machine {
  func lotate()
  init(name: String, currentSpeed: Double)
}

class Vehicle {
  var currentSpeed = 0.0
  var name = ""
  
  init(name: String, currentSpeed: Double) {
    self.name = name
    self.currentSpeed = currentSpeed
  }
}

class Car1: Vehicle, Wheel {
  
  required override init(name: String, currentSpeed: Double = 0.0) {
    super.init(name: name, currentSpeed: currentSpeed)
  }
  
  func lotate() {
    // 뀨
  }
  
  func join() {
    print("\(self.name)의 바퀴가 회전합니다.")
  }
}

class Carpet: Vehicle, Machine {
  func join() {
    // join..
  }
}

var translist = [Vehicle]()
translist.append(Car1(name: "자동촤", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄다", currentSpeed: 15.9))

for tran in translist {
  if let obj = tran as? Wheel {
    obj.lotate()
  } else {
    print("\(tran.name)의 하위 타입 변환이 실패했음")
  }
}


//: [Next](@next)
