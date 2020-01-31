//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

class Dog: NSObject {
  
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
  
  // 프린트했을때 어떤내용을 나타낼것인지 정의할수 있다.
  override var description: String {
    "Dog's name: \(name), age: \(age)"
  }
  
  // 디버그 프린트했을때 나타날 내용을 정의
  override var debugDescription: String {
    "Dog's name: \(name), age: \(age), feature: \(feature)"
  }
  
}

// 구조체는 nsobject를 상속받을수없음
struct Cat: CustomStringConvertible, CustomDebugStringConvertible {
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
  
  var description: String {
    "Cat's name: \(name), age: \(age)"
  }
  
  var debugDescription: String {
    "Cat's name: \(name), age: \(age), feature: \(feature)"
  }
  
}
