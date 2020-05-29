//: [Previous](@previous)

import Foundation

print("\n-------- [클로저 표현식] --------\n")
// func 생략 / 함수이름 생략 / 경량 문법 작서

  /**************************
   { (매개변수) -> 반환타입 in      -> 함수타입 in(실행시작)
     실행할 구문
   }
   *************************/

let f = { () -> Void in
  print("클로저가 실행되고있엉")
}
f()

({ () -> Void in
  print("클로저가 실행되고있엉")
})()

let c = { (s1: Int, s2: String) -> Void in
  print("s1: \(s1), s2: \(s2)")
}
c(30,"오옹ㅇ?")

({ (s1: Int, s2: String) -> Void in
  print("s1: \(s1), s2: \(s2)")
})(3, "뇸뇸뇸")


var value = [1,8,6,7,2,5,9]
var value2 = [1,8,6,7,2,5,9]

value.sort {
  $0 > $1
}
print(value)


func order(s1: Int, s2: Int) -> Bool {
  if s1 > s2 {
    return true
  } else {
    return false
  }
}
value2.sort(by: order)

value2.sort(by: {
  (s1: Int, s2: Int) -> Bool in
  if s1 > s2 {
    return true
  } else {
    return false
  }
})

({ (s1: Int, s2: Int) -> Bool in
  return s1 > s2
})
value.sort { (s1, s2) -> Bool in return s1 > s2 }
value.sort { (s1, s2) in return s1 > s2 }
value.sort { return $0 > $1 }
value.sort { $0 > $1 }
value.sort(by: >)
//value.sort { > }

func divide(base: Int, success s: () -> Void) -> Int {
  defer {
    s()
  }
  return 100 / base
}

divide(base: 100) { () in print("연산성공염") }
divide(base: 33) { print("성공염") }
divide(base: 10) { }


func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
  
  guard base != 0 else {
    f()
    return 0
  }
  
  defer {   // 코드흐름과 관계없이 가장 마지막에 실행. 함수의 종료직전 실행.
    s()
  }
  return 100/base
}

divide(base: 20, success: { () in
  print("success")
}) { () in
  print("fail")
}

print("\n-------- [@escaping, @autoclosure] --------\n")

/********************************************************
 @escaping -> 인자값으로 전달된 클로저를 저장해 두었다가
              나중에 다른곳에서도 실행할 수 있도록 허용해주는 속성
 ex) 중첩 함수내에서 클로저를 사용하기위해서 붙여주면 탈출가능!
 ********************************************************/


func callBack(fn: () -> Void) {
  fn()
}
callBack {
  print("Closure Start🍎")
}

func callback1(fn: @escaping () -> Void) {
  let f = fn // 클로저를 상수에 대입
  f()        // 대입된 클로저를 실행
}
callback1 {
  print("closure 탈출성공!")
}


/********************************************************
@autoclosure -> 인자값으로 전달된 일반 구문이나 함수 등을 클로저로
               래핑하는 역할, 일반구문을 인자값으로 넣어도 알아서 클로저로
ex) {} X () O
********************************************************/

func condition(stmt: () -> Bool) {
  if stmt() == true {
    print("true")
  } else {
    print("false")
  }
}


func condition1(stmt: @autoclosure () -> Bool) {
  if stmt() == true {
    print("true")
  } else {
    print("false")
  }
}

condition { 1 > 2 }
condition1(stmt: 4 > 2)




//: [Next](@next)
