//: [Previous](@previous)
/*:
 ## Set
 - Unordered Collection
 - Unique Value
 - Set Literal = Array Literal
 */
// 배열 / 딕셔너리에 비해 중요도 ↓


//let fruitsArr = ["Apple", "Orange", "Melon"]
//let numbersArr = [1, 2, 3, 3, 3]
//let emptyArr = [String]()


// set라고 선언해줌
let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()


/*:
 ### Number of Elements
 */
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")



let x: Set = [1, 2, 3, 4, 5]
let y: Set = [1, 2, 3, 4, 5]
x
y

let a = [1,2,3]
a[0]

//fruitsSet[0]    // 순서 X -> Index X // 순서가 없다보니 0번째의 값이 다를수있음
x.first   // O      //1번째 요소를 꺼낸다.


if fruitsSet.contains("Apple") {
  print("Contains Apple")
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
for element in productSet {
  if element.hasPrefix("i") {       //첫번째 문자열에 i가들어가느냐
    print(element)
  }
}


/*:
 ### Add a New Element
 */
print("\n---------- [ Add ] ----------\n")

//[1,2,3].append(1)     //뒤에 추가하는 개념이없음
//[1,2,3].insert(2, at: 0)  //

var stringSet: Set<String> = []
stringSet.insert("Apple")
stringSet

stringSet.insert("Orange")
stringSet

stringSet.insert("Orange")
stringSet


/*:
 ### Remove an Element
 */
print("\n---------- [ Remove ] ----------\n")

stringSet = ["Apple", "Orange", "Melon"]

stringSet.remove("Apple")       //인덱스가있는게아니라서 at말고 그냥입력해서 지움
stringSet

if let removed = stringSet.remove("Orange") {
  print("\(removed) has been removed!")
}

stringSet

stringSet.removeAll()


/*:
 ### Compare two sets
 */
print("\n---------- [ Compare ] ----------\n")

var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}


var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])

favoriteFruits1 == favoriteFruits2  //순서만 다르고 값은 같은데 true로나옴
favoriteFruits1.elementsEqual(favoriteFruits2)      //순서까지 같아야할때 비교하는 함수



// 포함 관계 여부. 상위/하위 집합.
// group1 ⊇ group2
let group1: Set = ["A", "B", "C"]
let group2: Set = ["A", "B"]

// superset
group1.isSuperset(of: group2)   //상위집합인지 알고플때
group1.isStrictSuperset(of: group2)
// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
group1.isStrictSuperset(of: group1)

// subset
group2.isSubset(of: group1)     //하위집합인지 알고플때
group2.isStrictSubset(of: group1)
group2.isStrictSubset(of: group2)


/*:
 ---
 ## Fundamental Set Operations
 - intersection - 교집합
 - symmetricDifference - 교집합의 여집합
 - union - 합집합
 - subtracting - 차집합
 ---
 */

//: ![Set](FundamentalSetOperations.png)



/*:
 ### intersection
 */
print("\n---------- [ intersection ] ----------\n")


favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// isDisjoint - 공집합일 경우 true 반환
if favoriteFruits.isDisjoint(with: tropicalFruits) {
  print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
  print("favoriteFruits ∩ tropicalFruits")
}

// 교집합에 해당하는 요소를 반환
let commonSet = favoriteFruits.intersection(tropicalFruits)
commonSet

// 교집합에 해당하는 요소만 남기고 나머지 제거
tropicalFruits.formIntersection(favoriteFruits)
tropicalFruits



/*:
 ### symmetricDifference
 */
print("\n---------- [ symmetricDifference ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 교집합의 여집합 요소들을 반환
let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet

// 교집합의 여집합 요소들로 데이터 변경
favoriteFruits.formSymmetricDifference(tropicalFruits)
favoriteFruits


/*:
 ### union
 */
print("\n---------- [ union ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 합집합 반환
var unionSet = favoriteFruits.union(tropicalFruits)
unionSet

// 합집합 요소들로 데이터 변경
favoriteFruits.formUnion(tropicalFruits)
favoriteFruits

/*:
 ### subtracting
 */
print("\n---------- [ subtracting ] ----------\n")

favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 차집합 반환 ,교집합 되는 부분만 제거
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet

// 교집합 요소 제거
favoriteFruits.subtract(tropicalFruits)
favoriteFruits


//: [Next](@next)
