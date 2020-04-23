# 191231

## optional 복습

1. Unwrapping optional (!)
2. Optional binding
3. Guard let
4. Nil (??)

```swift
/********************************************
 Forced unwrapping optional - 억지로 박스를 까보기 -> !
 -> 박스안에 값이 무조건 있을것이다 생각하고 억지로 깜! 근데 없으면.. 앱이죽음
 
 Optional binding - 부드럽게 박스를 까보자 -> if let
 
 Guard statment - 부드럽게 박스를 까보자 2탄 -> guard let
 
 Nil coalescing - 박스를 까 보았떠니 값이 없으면 디폴트 값을 줘보자.. -> ??
 ********************************************/

var carName: String? = "밴츠"

carName = nil

//unwrapping optional
print(carName!)

// Optional binding
if let unwrappedCarname = carName {
    print(unwrappedCarname)
} else {
    print("car name XXXXX")
}

// Guard statment
func printParsedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 변환이 안된다")
        return
    }
//    if let parsedInt = Int(from) {
//        print(parsedInt)
//    } else {
//        print("Int로 변환이 안된다")
//    }
    print(parsedInt)
}

printParsedInt(from: "100000")
printParsedInt(from: "ㅎㅎㅎㅎㅎㅋㅋㅋ")


// Nil coalescing
let myCarName = carName ?? "차를 사고싶다"
// carname의 값이 있다면 mycarname에 넣어라. 근데 값이 없다면 "차를 사고싶다"를 넣어라



// 최애 음식이름을 담는 변수를 작성하고 (string?), optional binding을 이용해서 값을 확인

var favoriteFood: String? = "김치찌개"
print(favoriteFood!)

if let favorite = favoriteFood {
    print("내가가장 좋아하는 음식은 \(favorite)")
} else {
    print("Nope!")
}
// 내가가장 좋아하는 음식은 김치찌개

func printfavoriteFood(food: String?) {
    guard let favorite = food else {
        return
    }
print(favorite)
}
printfavoriteFood(food: "청국좡") 
printfavoriteFood(food: nil)


// 닉네임을 받아서 출력하는 함수 만들기, 입력 파라미터 string?

func printNickName(name: String?){
    guard let nick = name else {
        print("닉네임을 만들어봐~")
        return
    }
    print(nick)
}
printNickName(name: "eunyuniii") // eunyuniii
printNickName(name: nil) // 닉네임을 만들어봐~

```



## Collection 복습

1. Array
2. Dictionary
3. Set

```swift
/********
 Array
*********/

var evenNumbers: [Int] = [2, 4, 6, 8]
let evenNumbers2: Array<Int> = [1, 2, 3, 4]

evenNumbers.append(10)

evenNumbers += [12, 13, 16, 18]

// 값이 비어있는지 확인
evenNumbers.isEmpty

//evenNumbers = []
//evenNumbers.isEmpty

evenNumbers.count

//print(evenNumbers.first)

if let firstElement = evenNumbers.first {
    print("---first item is \(firstElement)---")
}else{
    print("없쪄용")
}

evenNumbers.min()
evenNumbers.max()

// 1번째 array값을 저장
var secondElement = evenNumbers[1]
// var twentithElement = evenNumbers[20] // 에러

let firstThree = evenNumbers[0...2]

// 값이 있음을확인
evenNumbers.contains(3)
// 3이있냐 // false
evenNumbers.contains(4)
// 4가있냐 // true


evenNumbers
evenNumbers.insert(0, at: 0)

//evenNumbers.removeAll()

evenNumbers.remove(at: 0)
evenNumbers



// 값의 변경
evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

// 값끼리 변경
//evenNumbers.swapAt(1, 2)


for num in evenNumbers {
    print(num)
}

for (index, num) in evenNumbers.enumerated() {
    print("index: \(index), num: \(num)")
}

// 3개의 배열없애기
let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

// 마지막 배열없애기
let lastRemoved = firstThreeRemoved.dropLast()
lastRemoved

// 앞에서부터 배열가져오기
let firstThrees = evenNumbers.prefix(3)
// 뒤에서부터 배열가져오기
let lastThrees = evenNumbers.suffix(3)


/********
 Dictionary
*********/

var scoreDic: [String: Int] = ["Jason": 88, "Jay": 95, "Jake": 98]
var scoreDic1: Dictionary<String, Int> = ["Jason": 88, "Jay": 95, "Jake": 98]

print(scoreDic)
scoreDic["Jake"]
scoreDic["jerry"]

scoreDic.isEmpty
scoreDic.count

scoreDic["jason"] = 99
scoreDic["jason"]
scoreDic["jack"] = 100
scoreDic["jack"]

scoreDic
scoreDic["jack"] = nil
scoreDic

for (name, score) in scoreDic {
    print("\(name): \(score)")
}
//jason: 99
//Jake: 98
//Jason: 88
//Jay: 95

for key in scoreDic.keys {
    print("key: \(key)")
}
//key: jason
//key: Jake
//key: Jason
//key: Jay

// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리를 만들어보기
var eunyoungDict = ["name": "Eunyoung", "job": "Student", "city": "Seoul"]

// 2. 도시를 부산으로 업데이트
eunyoungDict["city"] = "Busan"
eunyoungDict

// 3. 딕셔너리를 받아서 이름과 도시출력하는 함수 만들기
func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    } else {
        print("cannot find")
    }
}
printNameAndCity(dic: eunyoungDict)


/********
 Set
*********/

var someArray: Array<Int> = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1]

someSet.contains(1)
someSet.contains(99)

someSet.insert(5)
someSet
```

