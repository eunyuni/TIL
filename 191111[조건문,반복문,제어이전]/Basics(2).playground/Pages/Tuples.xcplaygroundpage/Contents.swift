//: [Previous](@previous)
/*:
 ---
 # Tuples
 ---
 */
/*:
 ---
 ## Unnamed Tuple
 ---
 */
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)       //여러개의 값을 동시전달
type(of: threeNumbers)

threeNumbers

threeNumbers.0      // 0번째
threeNumbers.1
threeNumbers.2


var threeValues: (Int, Double, String) = (10,  100.0,  "이름")    //여러 타입가능
type(of: threeValues)

threeValues

threeValues.0 = 5   //0번째 값바꾸기
threeValues


/*:
 ## Decomposition
 */

let numbers = threeNumbers
numbers
numbers.0
numbers.1


let (first, second, third) = threeNumbers       //이름을 분해함
first
second
third

// wildcard pattern

let (_, second1, third1) = threeNumbers     // 사용안하는 변수 표현: _
// _말고 first1넣으면 그걸 사용안한다고 아래 메세지가 뜸
second1
third1


/*:
 ---
 ## Named Tuple
 ---
 */

// 튜플을 사용하는데 이름을 정해줌

let iOS = (language: "Swift", version: "4")  //이름을 주고 튜플로 묶음

let iOSS: (language: String, version: String) = (language: "Swift", version: "4")
let iOSO: (language: String, version: String) = ("Swift", "4")
let iOOS = (language: "Swift", version: "4")

iOS.0
iOS.1

iOS.language
iOS.version


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {   //입력,반환 모두 튜플
  return (a + b.0, a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second

/*:
 ## Comparison Operators
 * Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음
 * 7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함
 */


var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
something1 == something2

//var something3: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//var something4: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//something3 == something4
//7개이상이라 적용 안됨.


// 다음의 비교 결과는?
(1, "zebra") < (2, "apple")   //true
(3, "apple") > (3, "bird")    //false
("3.14", 99) > ("1.99", 1)    //true
("blue", 1) > ("bluesky", -1) //false
(4, "dog") == (4, "dog")      //true

/*
 Q. 다음 튜플 연산에 대한 결과는?
 
 - ("일", 1) > ("이", 2.0)
 - (1, "zebra") < ("2", "apple")
 - ("blue", false) < ("purple", true)
 */

("일", 1) > ("이", 2.0)
// (1, "zebra") < ("2", "apple")       1과 문자열2 비교가 안됨
// ("blue", false) < ("purple", true)   false, true는 크기비교가안됨
// true > false


/*:
 ---
 ## Tuple Matching
 ---
 */

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin")
case (_, 0):                                //y가 0일때
  print("\(somePoint) is on the x-axis")
case (0, _):                                //x가 0일때
  print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):                      //x,y가 -2~2일때
  print("\(somePoint) is inside the box")
default:
  print("\(somePoint) is outside of the box")
}
//위치에 따라 다른결과가 나올 수 있다.

/*:
 ## Dictionary Enumeration
 */

let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]
//키랑 벨류의 쌍 = Dictionary

for dict in fruits {
    dict.0
    dict.1
    dict.key
    dict.value
}

for (key, value) in fruits {
  print(key, value)
}
print()

//for element in fruits {
//  // 어떤 식으로 출력해야 할까요?
//}
for element in fruits {
    print(element)
}

//: [Next](@next)
