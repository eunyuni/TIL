//1. 배열순회탐색
var cities = ["seoul","new york","la","santiago"]
let lengh = cities.count // 배열의 길이 // <cities.count

for i in 0..<lengh {
    print("\(i)번째 배열 원소는 \(cities[i])입니다.")
}

for e in cities {
    print("배열 원소는 \(e)입니다.")
}

for p in cities {
    let v = cities.firstIndex(of: p)    //배열의 인덱스를 확인하여 v상수에 대입
    print("\(v!)번째 배열 원소는 \(p)입니다.")
}

//2. 선언 및 초기화
var city : Array<String>
city = Array()

type(of: cities)
cities.removeAll()

//선언: 이런 배열을 만들것이다
//초기화: 앞서 선언한 대로 실제로 만들어달라

var doroci : [String]   //배열 선언
var grr : Array<String>

var doci = [String]()   //배열 선언 & 초기화
grr = Array()           //배열 초기화

var ghgh : [String]
ghgh = [String]()

var list = [String]()

if list.isEmpty {
    print("배열이 비어 있는 상태입니다")
} else {
    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다")
}

//3. 배열아이템

//가. append: 입력된 값을 배열의 맨뒤에 추가한다.
//나. insert(at: ): 원하는 위치에 직접 추가할때사용.
//                  원하는 위치가능. 쉽게말해 끼어들기
//다. append(contentsOF: ): 여러개의 아이템을 배열에 한번에 추가

var city1 = [String]()
city1.append("Seoul")
city1.append("New York")
city1.insert("Tokyo", at: 1)
city1.append(contentsOf: ["Dubai","Sydney"])

city1[2] = "Madrid"
city1
city1.insert("Seoul", at: 0)

var city2 = [String](repeating: "Nope", count: 5)

var alphabet = ["a","b","c","d","e"]
alphabet[0...3]
alphabet[0...2]
alphabet[0..<3]

// 튜플
// 하나의 튜플에 여러개의 타입의 아이템 저장가능
// 선언되고 나면 상수적 성격을 띄므로 추가 삭제 변경 불가
// 소괄호()를 사용하여 아이템을 정의함

let tupleValue = ("a","b",1,2.5,true)
tupleValue.1
tupleValue.4
tupleValue.0



