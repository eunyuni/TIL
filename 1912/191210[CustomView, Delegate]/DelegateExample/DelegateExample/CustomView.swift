//
//  CustomView.swift
//  DelegateExample
//
//  Created by 은영김 on 2020/04/02.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

// 1. 프로토콜 정의
protocol CustomViewDelegate: class{
  func colorForBackground(_ newColor: UIColor?) -> UIColor
}
// 커스텀뷰에서 지정된것만 사용이 가능했는데 델리게이트를 해줌으로써 자유도가 생김


class CoustomView: UIView {
  
  // 2. delegate 프로퍼티 선언
  weak var delegate: CustomViewDelegate?
  // (프로토콜에서 클래스를 상속받지 않으면) weak로 만들면 오류발생 / 프로토콜이 클래스 바운드여야한다 weak는 참조와관련되어있는데 참조는 클래스와관련있고 이것을 프로토콜에 클래스라고 한정지어줘야한다.
  // weak는 class에서 사용하기때문에 protocol도 class를 상속해줘야함
  
  override var backgroundColor: UIColor? {
    // override한 프로퍼티는 연산으로 사용해야함 저장이불가
    get { super.backgroundColor }
    set {
      
      // 3. delegate 메서드호출
      let color = delegate?.colorForBackground(newValue)
      // 델리게이트가 누가될진모르지만 델리한테물어봄 이걸 받아서 처리해줄 객체가 있다면 그놈이 받아서 처리해줘(프로토콜을 통해) 컬러포백그라운드 함수를 수행시킬거니까 이걸 구현해서 컬러를 돌려줘라 라는의미..ㅎ
      let newColor = color ?? newValue ?? .gray
      super.backgroundColor = newColor
      print("새로변경될 색은:", backgroundColor!)
      
// super.backgroundColor = newValue
// print("새로 변경될 색은: ", newValue)
      
      // super.backgroundColor = newValue ?? .black
      
      // if newValue == .red {
      // super.backgroundColor = .blue
      // }
      // 고정값을 주는것.
      
      // if newValue == .red {
      // super.backgroundColor = .blue
      // print("새로 변경될 색은: ", newValue)
      // } else if newValue == nil {
      // super.backgroundColor = .black
      // print("새로 변경될 색은: ", newValue)
      // } else {
      // super.backgroundColor = newValue
      // print("새로 변경될 색은: ", newValue)
      // }
      
      // switch newValue {
      // case UIColor.red:
      // super.backgroundColor = .blue
      // case nil:
      // super.backgroundColor = .black
      // default:
      // super.backgroundColor = newValue
      // }
      
    }
  }
  // 나만의 커스텀뷰를 만들어서 사용
  // 커스텀뷰를 상속받으면 항상 프린트함
}
