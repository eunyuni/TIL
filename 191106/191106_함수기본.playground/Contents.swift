import UIKit

// 1. 함수선언의 기본형태
// func 함수이름(매개변수1이름: 매개변수1타입,매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
// return 반환값
// Int타 입의 값을 반환하는 함수
//예시) sum으로 a,b라는 int타입의 매개변수를 가지며 int 타입의 값을 반환하는 함수
func sum(a: Int, b: Int, c: Int, d: Int) -> Int {
    return a + b * c / d
 }

sum(a: 3, b: 8 ,c: 1, d: 2)
sum(a: 900, b: 1300, c: 46, d: 2)
sum(a: 4334273, b: 2632748, c: 33, d: 2)

// 2. 반환 값이 없는 함수
// func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> Void {
// return 반환값

func printMyName(name: String) -> Void{
    print(name)
}
//void = () 없다 라는 타입 별칭
printMyName(name: "eunyoung")
printMyName(name: "LALALALAL!")

func printName(name: String) {
    print(name)
}
// void를 생략 가능
printName(name: "eyeyoung")

// 3. 매개변수가 없는 함수
// func 함수이름() -> 반환타입 {
// return 반환값

func maximumValue() -> Int{
    return Int.max
}
maximumValue()

// 4. 매개변수와 반환값이 없는 함수
// func 함수이름() -> Vold {
// return

// 함수구현이 짧은 경우
// 가독성을 해치지 않는 범위에서
// 줄바꿈을 하지 않고 한 줄에 표현해도 무관
func hello() -> Void{print("hello")}
hello()

// 반환 값이 없는 경우, 반환 타입(Void)을 생략해 줄 수 있다.
// func 함수이름() {
// return(
func bye() {print("bye")}
bye()





