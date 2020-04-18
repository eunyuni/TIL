import UIKit
// 06. 컬렉션 타입(Array, Dictionary, Set)
// Array - 순서가 있는 리스트 컬렉션<br>
// Dictionary - 키와 값의 쌍으로 이루어진 컬렉션<br>
// Set - 순서가 없고, 멤버가 유일한 컬렉션(집합)<br>

//MARK: - Array

//멤버가 순서(인덱스)를 가진 리스트 형태의 컬렉션 타입

// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(100)
integers.append(1)
// append / 추가
// integers.append(101.1) 더블타입이라 int타입에 들어가지않음
print(integers)

// 멤버 포함 여부 확인: contains
integers.contains(100)
integers.contains(99)

// 멤버교체
integers[0] = 99
print(integers)

// 멤버삭제
integers.remove(at: 1) // 1번째 멤버삭제
print(integers)
integers.removeLast() // 마지막멤버 삭제
integers.removeAll() // 모두없애

// 멤버 수 확인
integers.count //=print(integers.count)
print(integers.count)

// Array<Double>와 [Double]는 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()
var strings: [String] = [String]()
var characters: [Character] = []
//빈 "[]"만 넣어도 비어있는 생성(그냥 () 안되더라)

var arrayyy: Array<Int> = Array<Int>()
//위와 동일한 표현
//var arrayyy: Array<Int> = Array<Int>
//var arrayyy: Array<Int> = [Int]()
//var arrayyy: Array<INT> = []
//var arrayyy: [Int] = Array<Int>()
//var arrayyy: [Int] = [Int]()
//var arrayyy: [Int] = []
//var arrayyy = [Int]()

// 11.7 연습
var dlfma: Array<Int> = Array<Int>()
var dlfmadlfma: Array<Int> = []
dlfmadlfma.append(22)
print(dlfmadlfma)
dlfma.append(88)
print(dlfma)

//let을 사용하여 Array를 선언하면 변하지않는 Array 선언
let immutableArry = [1,2,3]
// immutableArry.append(4)
// immutableArry.removeAll() / append와 마찬가지로 변경이 불가한 let여서 멤버 추가 삭제 불가

//MARK: - Dictionary

// '키'와 '값'의 쌍으로 이루어진 컬렉션 타입
// Array와 비슷하게 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양합니다.

var oii: Array<Int> = Array<Int>()
var oiie = [String: Any]()
var ioo : Array<String> = []

// key가 string타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
//위와 동일 표현
//var anyDictionary: Dictionary<String, Any> = [:]
//var anyDictionary: [String: Any] = Dictionary<String, Any>()
//var anyDictionary: [String: Any] = [String: Any]()
//var anyDictionary: [String: Any] = [:]
//var anyDictionary = [String: Any]()

//키에 해당하는 값 할당
anyDictionary["somekey"] = "value"
anyDictionary["anotherkey"] = 100

print(anyDictionary)

// 키 값 변경
anyDictionary["somekey"] = "something"
print(anyDictionary)

// 키 값 제거
anyDictionary.removeValue(forKey: "anotherkey")
print(anyDictionary)
anyDictionary["somekey"] = nil
print(anyDictionary)

let emptyDictionary: [String: String] = [:]
let iniDictionary: [String: String] = ["name" : "eunyoung", "gender": "female"]
// emptyDictionary["key"] = "value" 불변Dictionary 이므로 값변경 불가
// let someValue: String = initalizedDictionary["name"]
// "name"라는 키에 해당하는 값이 없을 수 있으므로 String타입의 값이 나올거라는 보장이 없으므로 오류발생

//MARK: - Set

// 1. Set의 생성
// 중복되지 않는 멤버가 순서없이 존재함
// Array, Dictionary와 다르게 축약형이 존재하지 않음

var integerSet: Set<Int> = Set<Int>()

// insert: 새로운 멤버등록, 동일값은 여러번 해도 한번만 저장
integerSet.insert(1)
integerSet.insert(50)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(100)


print(integerSet)

//멤버 개수
integerSet.count
// 멤버 포함 여부 확인
print(integerSet.contains(1))
print(integerSet.contains(88))

// 멤버 삭제
integerSet.remove(99)
integerSet.removeFirst()
print(integerSet)

// 2. Set의 활용
// 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용합니다.

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union)

// 순서정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion)

//교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection)

//차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting)
let subtractingg: Set<Int> = setB.subtracting(setA)
print(subtractingg)















