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

calc(operand: .times)(29,10)



let c3 = calc(operand: .divide)
c3(10,5)
let c4 = calc(operand: .plus)
c4(70,9)


// 3. 함수의 인자값으로 함수를 사용할 수 있음











//: [Next](@next)
