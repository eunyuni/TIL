//: [Previous](@previous)
/*:
 # Type Conversion
 */
//타입을 다른걸로 변환함
let height = Int8(5)
let width = 10 //int카입
//let area = height * width    인트타입이 달라서 연산이안돼. 8,10
//print(area)
//ㅑㅜㅅ8 * ㅑㅜㅅ

let h = Int8(12)
let x = 10 * h //10을 인트8로 정해지지않아서 인트 8로인식되어 계산함
print(x)
//let x = 20 * h    인트8이 인식못하는 숫자이기 때문에 에러뜸
//리터럴이라는 데이터타입으로 저장 10이라는 숫자가

/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num) // 실수로 바꾸고싶다.
type(of: floatNum)

var f = 3.14
Int(f)  //정수는 소수를 나타내지않기에 알아서짤림

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)


let anInteger: Int = -15
let absNum = abs(anInteger)  //절대값으로 표현 abs
type(of: absNum)


//: [Next](@next)
