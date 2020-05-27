//: [Previous](@previous)

import Foundation

// 옵셔널타입: 반환하고자 하는 값을 옵셔널 객체로 다시한번 감싼 형태

// 옵셔널 타입만 nil을 반환할 수 있다
let capital = ["KR": "Seoul", "CN": "Beijing", "JP": "Tokyo"]
capital["KO"]

let num = Int("Swift") // num: Int? 와 같음
let intFromStr = Int("123")



print("\n-------- [옵셔널 강제해제] --------\n")

// !연산자를 사용할 때는 반드시 nil을 점검해주어야 오류를 미연에 방지할 수 있다.
if intFromStr != nil {
  print("옵셔널이 해제된 값은", intFromStr!)
  // true일때만 강제해제 연산자를 사용해서 옵셔널을 해제시킨다
} else {
  print("Fail...")
}

num != nil ? print("Success") : print("Fail..")

// 오류를 발생할 가능성이 있다면 반환타입을 옵셔널 타입으로 설정해야 한다.
var result: Int? = nil

print("\n-------- [옵셔널 바인딩] --------\n")

var str = "Swfit"

if let intFromStr = Int(str) {
  print("변환된 값은 \(intFromStr)")
} else {
  print("Fail🤪")
}

func intStr(str: String) {
  guard let intFromStr = Int(str) else { print("guard 실패!"); return }
  print("변환된값은 \(intFromStr)")
}
intStr(str: "12344")
intStr(str: "호옹이?")

print(capital["KR"])
print(capital["KR"]!)

if (capital["KR"] != nil) {
  print(capital["KR"]!)
}

if let val = capital["KR"] {
  print(val)
}


print("\n-------- [컴파일러에 의한 옵셔널 자동해제] --------\n")

// 비교연산을 처리할 때는 옵셔널 타입여부에 구애받지 않고 일반 자료형처럼 값을 비교하면 된다.
let tempInt = Int("123")

tempInt == 123
tempInt == Optional(123)
tempInt! == 123
tempInt! == Optional(123)
tempInt != 99


print("\n-------- [묵시적 해제] --------\n")
// 자동으로 옵셔널이 해제된다

var strr: String! = "Swift Optional"
print(strr)


var value01: Int? = 10
//value01 + 3
var value02: Int! = 10
value02 + 3

//: [Next](@next)
