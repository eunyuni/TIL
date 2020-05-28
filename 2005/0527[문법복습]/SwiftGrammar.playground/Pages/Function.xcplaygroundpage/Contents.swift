//: [Previous](@previous)

import Foundation

print("\n-------- [함수의 반환값과 튜플] --------\n")
func getIndvInfo() -> (Int, String, Character) {
  let height = 100
  let name = "뇸뇸뇸"
  let babo: Character = "🤣"
  return (height, name, babo)
}
var uInfo = getIndvInfo()
uInfo.0
uInfo.1
uInfo.2

var (a,b,c) = getIndvInfo()
a
b
c

var (cc, _, dd) = getIndvInfo()
cc
dd

func getUserInfo() -> (h: Int, g: Character, n: String) {
  let gender: Character = "W"
  let height = 163
  let name = "으늉찡"
  
  return (height, gender, name)
}
var result = getUserInfo()
result.g
result.h
result.n

typealias infoResult = (Int, Character, String)
typealias infoResult2 = (h: Int, g: Character, n: String)

func getUserInfo2() -> infoResult {
  let gender: Character = "W"
   let height = 163
   let name = "으늉찡"
  
   return (height, gender, name)
}

let info = getUserInfo2()
info.0
info.1
info.2


print("\n-------- [InOut 매개변수] --------\n")

// 참조전달 -> inout
// 상수나 리터럴은 inout에 인자값으로 전달할 수 없음
var count = 30
func foo(param: inout Int) -> Int {
  param += 1
  return param
}

foo(param: &count)
count

print("\n-------- [일급 객체로서의 함수] --------\n")

// 1. 변수나 상수에 함수를 대입할 수 있음

func addOne(base: Int) -> String {
  
  return "결과값은 \(base + 1)입니당"
}

let fn1 = addOne(base: 5)
let fn2 = addOne
fn2(count)

// 변수나 상수에 함수를 대입할땐 실행되는것이 아니라 함수라를 객체 자체만 대입된다.
func fooo(base: Int) -> String {
  print("fooo Start~~~")
  return "결과값은 \(base + 100)이다"
}
let fn3 = fooo(base: 20)

// 함수타입에서 필요한것은 단지 어떤 값을 입력받는지와 반환하는지 뿐이다.
let fn4 = fooo

fn4(70)


// 2. 함수의 반환타입으로 함수를 사용할 수 있음

func duck() -> String {
  return "this is duck()"
}

func pass() -> () -> String {
  return duck
}

let mjjjj = pass
let p = pass()
p()


func plus(a: Int, b: Int) -> Int {
  a + b
}
func minus(a: Int, b: Int) -> Int {
  a - b
}
func times(a: Int, b: Int) -> Int {
  a * b
}
func divide(a: Int, b: Int) -> Int {
  guard b != 0 else { return 0 }
  return a / b
}

enum sss {
  case plus
  case minus
  case times
  case divide
}

func calc(operand: sss) -> (Int, Int) -> Int {
  
//   switch operand {
  //  case "+":
  //    return plus
  //  case "-":
  //    return minus
  //  case "*":
  //    return times
  //  case "/":
  //    return divide
  //  default:
  //    return plus
    
  switch operand {
  case .plus:
      return plus
  case .minus:
      return minus
  case .times:
      return times
  case .divide:
      return divide
  }
}
//let c1 = calc(.plus)
//c1(5,8)

let c2 = calc(operand: .minus)
c2(10,8)

let c2_2 = calc(operand: .times)(29,10)



let c3 = calc(operand: .divide)
c3(10,5)
let c4 = calc(operand: .plus)
c4(70,9)


// 3. 함수의 인자값으로 함수를 사용할 수 있음

func incr(param: Int) -> Int {
  return param + 1
}
func broker(base: Int, function fn: (Int) -> Int) -> Int {
  return fn(base)
}
broker(base: 3, function: incr)

func successThrough() {
  print("연산처리 성공!")
}
func failThrough() {
  print("오류오류발쉥")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
  
  guard base != 0 else {
    fCallBack()
    return 0
  }
  
  defer {   // 코드흐름과 관계없이 가장 마지막에 실행. 함수의 종료직전 실행.
    sCallBack()
  }
  return 100/base
}

divide(base: 20, success: successThrough, fail: failThrough)

divide(base: 30,
       success: {
        () -> Void in
        print("연산처리썽공!")},
       fail: {
        () -> Void in
        print("오류오류발쉥")})

divide(base: 50,
       success: { print("연산처리썽공!") },
       fail: { print("오류오류발쉥") })
// divide(base: <#T##Int#>, success: <#T##() -> Void#>, fail: <#T##() -> Void#>)

print("\n-------- [중첩 함수] --------\n")

// 내부함수 호출
func outer(base: Int) -> String {
  
  func inner(inc: Int) -> String {
   return "\(inc)를 반환합니다."
  }
  let result = inner(inc: base + 10)
  return result
}

outer(base: 10)


// 반환값으로 내부함수 사용
func outer(param: Int) -> (Int) -> String {
  
  func inner(inc: Int) -> String {
    return "\(inc)를 리턴합니다."
  }
  return inner
}

//let fn55 = outer
let fn5 = outer(param: 30)
let fn6 = fn5(30)


func basic(param: Int) -> (Int) -> Int {
  let value = param + 20
  
  func append(add: Int) -> Int {
    print("append 실행 값은 \(value + add)")
    return value + add
  }
  
  return append
}

let fn7 = basic(param: 30)
fn7(70)



//: [Next](@next)
