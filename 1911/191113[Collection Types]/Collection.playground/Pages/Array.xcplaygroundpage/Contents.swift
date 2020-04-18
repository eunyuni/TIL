//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */

/*:
 ### Mutable, Immutable
 */

var variableArray = [1, 2]
variableArray = [] // 0이 제일 첫번째

let constantArray = [1, 2]
//constantArray = []


/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]    //int타입으로 할거라고 명시했는데
arrayFromLiteral = []
type(of: arrayFromLiteral)

//let emptyArray = []
// 추론할 타입이 없기 때문에 에러가 발생한다. 배열이지만 무슨값을 넣을지 정해지지않아서 에러발생

let emptyArray: [String] = []   //문자를 넣겠다고 선언하면 가능

/*:
 ### Initialize
 */

// Type Annotation
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]

// Type Inference 추론도 가능
let strArray3 = ["apple", "orange", "melon"] //동일 타입을 넣어주면 string인지 추론함
let strArray4 = Array<String>(repeating: "iOS", count: 5)
// -> ["IOS", "IOS", "IOS", "IOS", "IOS",]


// Error
//let strArray5 = ["apple", 3.14, 1] 타입이 다르므로 오류발생


/*:
 ---
 ### Question
 - String 타입과 Int 타입으로 각각 자료가 없는 상태인 빈 배열을 만들어보세요.
 - Double 타입은 Type Annotation, Bool 타입은 Type Inference 방식으로 각각 임의의 값을 넣어 배열을 만들어보세요.
 ---
 */
var string1 : [String] = ["안녕", "바보"]
var int1 : [Int] = [6, 7, 8]


/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count

if !fruits.isEmpty {        // isEmpty = 배열이 비어있는지 아닌지 !=비어있지않으면
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}
//!.isEmpty = 비어있지않을때 트루
/*:
 ### Retrieve an Element
 */
//              0        1         2          3
// fruits = ["Apple", "Orange", "Banana"] "endIndex" ]

fruits[0]
fruits[2]
//fruits[123]

//fruits.startIndex     //시작번호 = 0
//fruits.endIndex       //끝번호 = 바나나인2번이아니라 그다음을 가르킴. = 3

fruits[fruits.startIndex]
fruits[fruits.endIndex - 1]     //endindex로접근시에는 -1로 해야 바나나를 불러올 수 있음
type(of: fruits.endIndex)


fruits.startIndex == 0
fruits.endIndex - 1 == 2


/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {     // A가있는지 확인여부를 Bool로알려줌 맞으면 트루
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

if let index = alphabet.firstIndex(of: "D") {       //D값이 몇번째에 있는지알고플때 = firstIndex
  print("index of D: \(index)")     //if 로감싸주면 노란! 안뜸
} else {
    print("No index")
}

let idx1 = alphabet.firstIndex(of: "D")     //값이 없을수도 있을수도있기에 optional이 나옴
print(idx1)

let idx2 = alphabet.firstIndex(of: "Q")
print(idx2)


/*:
 ### Add a new Element
 */

//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")       //append = 값 추가
alphabetArray += ["C"]          // += append
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2  // 같은타입을 더해줄수있다.

//alphabetArray.append(5.0)     //다른타입은 못더함
//alphabetArray + 1             //단순 더하기는 안됨.
alphabetArray + ["ㅊ"]   //

alphabetArray.insert("S", at: 0)        //0번째에 s추가하겠다.
alphabetArray.insert("F", at: 3)        //3번째에 f추가. (남은건 뒤로밀림)
alphabetArray

/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"      //0번째를 대입해주면 값이 바뀜
alphabetArray


1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]      //초기화를 다시함
alphabetArray[2...] = ["Q", "W", "E", "R"]          //2부터 넣기
alphabetArray

alphabetArray[2...] = ["Q", "W"]                    //2...이상을 다바꾼다는의미
alphabetArray   // 결과?  [A,B,Q,W]


/*:
 ### Remove an Element
 */
//배열 요소 제거

alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)       // 0번째 요소제거
// removed == "A" {                  //제거가 a 일때는 다른데이 넣기도 가능
//    alphabetArray.append(<#T##newElement: String##String#>)
//})
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {     //c의 위치를 찾고
  alphabetArray.remove(at: indexC)                      //위치c에 넣음??
}
alphabetArray

//-> c를 제거하고싶은데 c가어디에있는지모를때 indexC에 할당함 그리고 그것을 제거하겠다는 뜻

/*:
 ### Sorting
 */
//정렬

alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()                     //shuffle 섞음! 막섞음 할때마다 달라짐

alphabetArray.sort()            //오름차순 정렬
alphabetArray

// shuffle vs shuffled
// sorted vs sort

//d가 붙은 것들이 지는 그대로 있고 변환한 값을 반환한다.
//단순 동사 현재형은 자기자신이 바뀌는것

//func sorted() -> [Element]
//mutating func sort()

alphabetArray.shuffled()        //값을 반환하는데 alphabetArray는 변치않고 다른값을 반환
alphabetArray.shuffle()         //본인이 변환하고 반환값이 없는



var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray
alphabetArray.sort() //void로 지가변함!


// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )       //sorted 원하는 형태로 정렬할수있도록
sortedArray


/*:
 ### Enumerating an Array
 */
print("\n---------- [ Enumerating an Array ] ----------\n")

// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) {
    print("\(index) - \(value)")
  }
}


for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {        //가장많이 사용하는 형태
  print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
  print("\(index) - \(element)")
}

//reversed 값이 반대로되는것
/*:
 ---
 ### Question
 ---
 */
/*
 - ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
 - 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 - 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
 */

var puppyy : [String] = ["p", "u", "p", "p", "y"]
puppyy.remove(at: 4)
print(puppyy)

var nana : [Int] = [1, 2, 4, 8, 9, 12, 13]
var nono : [Int] = [2, 5, 6, 9, 13]




// 2번 문제
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

// 3번 문제
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59





/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ Answer ] ----------\n")

/*
 ["p", "u", "p", "p", "y"] 라는 배열에서 마지막 "p" 문자 하나만 삭제하기
 */

var puppy = ["p", "u", "p", "p", "y"]
if let lastIndexOfP = puppy.lastIndex(of: "p") {
  puppy.remove(at: lastIndexOfP)
}
puppy


/*
 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 */

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []
for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

result



/*
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 */

// 1) Swift 에서 제공하는 기본 함수인 max() 를 이용하는 방법
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2) 두 수 중 높은 값을 반환하는 max 를 이용하거나, 3항 연산자를 이용하는 방법
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min
  for number in list {
    maxValue = max(maxValue, number)
    
    // 위 함수는 다음의 3항 연산자와 동일
    // maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])



//: [Next](@next)
