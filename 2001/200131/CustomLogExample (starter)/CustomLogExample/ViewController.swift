//
//  ViewController.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

struct MyData {
  let data1 = "Data~~"
  let data2 = "Data~~"
  let data3 = "Data~~"
  let data4 = "Data~~"
}

final class ViewController: UIViewController {
  private let dog = Dog()
  private let cat = Cat()
  private let data = MyData()
  
  // self일때 나를 정의해 줄 수 있음 나를 프린터할때
  // 내가원하는 형태로 프린터를 할 수 있다.
  //  override var description: String {
  //    return "ViewController!!!"
  //  }
  //
  //  override var debugDescription: String {
  //    return "ViewController Debuggint!!!"
  //  }
  
  @IBAction private func didTapPrint(_ sender: Any) {
    print("\n---------- [ print ] ----------\n")
    print("Hello, world!")
    print(1...10)
    print(dog)
    print(cat)
    print(self)
  }
  
  @IBAction private func didTapDebugPrint(_ sender: Any) {
    // 좀더상세한 프린트
    print("\n---------- [ debugPrint ] ----------\n")
    debugPrint("Hello, world!")
    debugPrint(1...10)
    debugPrint(dog)
    debugPrint(cat)
    debugPrint(self)
  }
  
  @IBAction private func didTapDump(_ sender: Any) {
    // 한단계 더 자세한 프린트
    print("\n---------- [ dump ] ----------\n")
    dump("Hello, world!")
    dump(1...10)
    dump(dog)
    dump(cat)
    dump(self)
  }
  
  @IBAction private func didTapNSLog(_ sender: Any) {
    // 현재시간, 등..?
    print("\n---------- [ NSLog ] ----------\n")
    NSLog("Hello, world!")
    NSLog("%@", self)
    NSLog("%d", 1)
    
    NSLog("%@", dog) // 클래스를 그냥nslog할수가 없음.. 도그를 nslog를 이용해서 출력하고싶으면 클래스만들때 상속받아야함
    NSLog("%@", cat.description)
  }
  
  @IBAction private func didTapSpecialLiterals(_ sender: Any) {
    print("\n---------- [ didTapSpecialLiterals ] ----------\n")
    /*
     #file : (String) 파일 이름
     #function : (String) 함수 이름
     #line : (Int) 라인 넘버
     #column : (Int) 컬럼 넘버
     */
    
    print("file:", #file)
    print("function:", #function)
    print("line:", #line)
    print("column:", #column)
    
    print("\n---------- [ Example ] ----------\n")
    print("<  \(#function) [\(#line)]  >  \(cat)")
  }
  
  @IBAction private func didTapCustomLog(_ sender: Any) {
    print("\n---------- [ Custom Log ] ----------\n")
    print("Hello, world!")
    print(dog)
    print(cat)
    print(self)
    
    print("\n---------- [ Custom Log ] ----------\n")
    logger("Hello, world!", header: "String")
    logger(dog, header: "Dag")
    logger(cat, header: "Cat")
    logger(self, header: "ViewController")
    
  }
  
  @IBAction private func didTapTestButton(_ sender: Any) {
    print("\n---------- [ Test ] ----------\n")
    // 테스트용 버튼
  }
}



