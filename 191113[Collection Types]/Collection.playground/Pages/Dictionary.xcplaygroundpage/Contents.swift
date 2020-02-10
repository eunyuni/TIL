//: [Previous](@previous)
import Foundation

/*:
 ## Dictionary
 - Element = Unique Key + Value
 - Unordered Collection
 */
//키값은 유일해야하고 value는 유일하지 않아도 됨
/*:
 ### Dictionary Literal
 */


//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]  :으로 구분!
//var dictFromLiteral = [1: "value 1", 2: "value 2"]
//var dictFromLiteral = ["1": 1, "2": 2]
//dictFromLiteral = [:]

//value는 같아도되지만 key는 같을 수 없음.

// 오류
//var dictFromLiteral = [:] 타입의 정의가없기에 에러발생

/*:
 ### Dictionary Type
 */
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]


/*:
 ---
 ### Question
 - 키가 String이고 값이 Int 타입인, 자료가 없는 상태의 빈 딕셔너리를 만드세요.
 - Type Annotation 과 Type Inference 방식을 모두 이용해 여러 가지 데이터를 넣어 딕셔너리를 만들어보세요.
 ---
 */
let add: [String : Int] = [:]
let acc = ["ca" : 3]

/*:
 ### Number of Elements
 */
print("\n---------- [ Number of Elements ] ----------\n")

var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}

/*:
 ### Retrieve an Element
 */
print("\n---------- [ Retrieve ] ----------\n")

words["A"]      //키로 접근해서 value를 꺼냄
words["Q"]      //Q가없다는 의미로 nil이나옴

if let aValue = words["A"] {        //값이있을때 aValue넣어사용하고 없으면 "Not found"
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)       //키만 꺼낼때
print(words.values)     //value만 꺼낼때

let keys = Array(words.keys)        //배열로 다루고싶을때 array로 묶음 ???????? ??
let values = Array(words.values)



/*:
 ### Enumerating an Dictionary
 */
print("\n---------- [ Enumerating ] ----------\n")

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {      //키만사용
  print("Key :", key)
}

for (_, value) in dict {        //벨류만사용
  print("Value :", value)
}

for value in dict.values {
  print("Value :", value)
}



/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

//var words = ["A": "Apple", "B": "Banana", "C": "City"]

//for (key, _) in words {
//  if key == "A" {
//    print("contains A key.")
//  }
//}


if words.contains(where: { (key, value) -> Bool in      // ????
  return key == "A"
  }) {
  print("contains A key.")
}


/*:
 ### Add a New Element
 */
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"       //키가없어서 키가 추가됨
words

words["B"] = "Blue"
words


/*:
 ### Change an Existing Element
 */
print("\n---------- [ Change ] ----------\n")

words = [:]
words["A"] = "Application"
words

words["A"] = "App"
words


// 키가 없으면 데이터 추가 후 nil 반환,
// 키가 이미 있으면 데이터 업데이트 후 oldValue 반환

if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("Insert \(words["A"]!)")
}
words


if let oldValue = words.updateValue("Steve Jobs", forKey: "S") {
  print("\(oldValue) => \(words["S"]!)")
} else {
  print("Add S Key with \(words["S"]!)")
}
words

/*:
 ### Remove an Element
 */
print("\n---------- [ Remove ] ----------\n")

words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
words["S"] = nil        //반드시 매칭을 이뤄야하는데 nil이들어가면 키,값이 전체다 사라짐
words["Z"] = nil        //z는 어차피 없는 키이기때문에 무시됨
words

// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
  print("\(removedValue) removed!")
}
words

words.removeAll()



/*:
 ### Nested
 */
print("\n---------- [ Nested ] ----------\n")

var dict1 = [String: [String]]()
//전체는 딕셔너리인데 벨류가 [String]가진 배열임
//dict1["arr"] = "A"
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: String]]()        //딕셔너리안의 딕셔너리
dict2["user1"] = [
  "name": "나개발",
  "job": "iOS 개발자",
  "hobby": "코딩",
]
dict2["user2"] = [
  "name": "나바보",
  "job": "Adroid 개발자",
  "hobby": "코딩",
]
dict2



// 예
[
  "name": "나개발",
  "job": "iOS 개발자",
  "age": 20,
  "hobby": "코딩",
  "apps": [
    "이런 앱",
    "저런 앱",
    "잘된 앱",
    "망한 앱",
  ],
  "teamMember": [
    "designer": "김철수",
    "marketer": "홍길동"
  ]
] as [String: Any] //딕셔너리는 any를 자주쓰임


/*:
 ---
 ### Question
 - Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
 - Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
 - 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기
 - 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
 ---
 */

// 1번 문제
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : 91.25

// 2번 문제
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
// 결과 : [("kor", 92), ("eng", 88), ("math", 96), ("science", 89)]

// 3번 문제
/*
 패스트캠퍼스
  - 스쿨
   * iOS 스쿨
   * 백엔드 스쿨
   * 프론트엔드 스쿨
  - 캠프
   * A 강의
   * B 강의
  - 온라인
   * C 강의
   * D 강의
  */

// 4번 문제
// 자세한 내용은 Optional 시간에 배울 예정


/*:
 ---
 ### Answer
 ---
 */

// Dictionary 로 저장되어 있는 시험 성적의 평균 점수 구하기
let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]

var sum = 0
for score in scores.values {
  sum += score
}
var average = Double(sum) / Double(scores.values.count) //Double(scores.count)
print(average)



// Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
var scoreArr: [(String, Int)] = []

for (key, value) in scores {        //1
  scoreArr.append((key, value))
}



//for dict in scores {              //2
//  scoreArr.append(dict)
//}

//scoreArr = Array(scores)          //3 다동일한 방법임

scoreArr




// 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기

/*
 패스트캠퍼스
  - 스쿨
    * iOS 스쿨
    * 백엔드 스쿨
    * 프론트엔드 스쿨
  - 캠프
    * A 강의
    * B 강의
  - 온라인
    * C 강의
    * D 강의
 */

let fastcampus = [
  "패스트캠퍼스": [
    "스쿨": ["iOS 스쿨", "백엔드 스쿨", "프론트엔드 스쿨"], "캠프": ["A 강의", "B 강의"],
    "온라인": ["C 강의", "D 강의"],
  ]
]


// 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
// 자세한 내용은 Optional 시간에 배울 예정

if let 패캠 = fastcampus["패스트캠퍼스"] {
  if let 스쿨 = 패캠["스쿨"] {
    print(스쿨[0])
  }
}

type(of: fastcampus)

if let 패캠 = fastcampus["패스트캠퍼스"], let 스쿨 = 패캠["스쿨"], let iOS = 스쿨.first {
  print(iOS)
}

print(fastcampus["패스트캠퍼스"]!["스쿨"]![0])      //!는 옵셔널을 제거할때사용.권장은아님
//패스트캠퍼스가 잇을수도 없을수도있어서 /!는 무조건있다는 전제를 깔아줌

//print(fastcampus["패스트캠퍼스"]?["스쿨"]?[0])    옵셔널 뜨게됨


//: [Next](@next)
