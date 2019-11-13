
//[ 실습 문제 ]
//<1>
//[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
//위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
//스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수

let chulsuHouse: [String: String] = ["철수": "apple", "영희": "banana", "진수": "grape", "미희": "strawberry"]
//if chulsuHouse.contains(where: { (a, b) -> Bool in
//    return b == "e"
//}) {
//    print("e가 들어간 과일을 좋아하는 학생이름")
//}



var names : [String] = []
func loveFruit() -> Array<String> {
    for (name, fruit) in chulsuHouse {
        if fruit.contains("e") {
        names.append(name)
        }
    }
    return names
}
loveFruit()

//var names : [String] = []
//for (name, fruit) in chulsuHouse {
//    if fruit.contains("e") {
//        names.append(name)
//    print(names)
//    }
//}
//names


//<2>
//임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

let odod = [2, 8, 7, 1, 4, 3]
//odod.max()
//odod.min()
//var sortdeOdod = odod.sorted()
 
func ex2(arr: [Int]) -> [Int] {
    var sum: [Int] = []
    
    for x in arr {
        if x % 2 == 0 {
        sum.append(x)
        } else {
            sum.insert(x, at: 0)
        }
    }
    return sum
}
ex2(arr: odod)

//[ 과제 ]
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321, 10293 -> 39201

func project(arr: Int) -> Int {
    let arr1 = String(arr)
    return Int(String(arr1.reversed()))!
}
project(arr: 1233445667889)

//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//+ 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


let 식육목은 = [
        "식육목":[
            "개과":[
                "개": ["자칼","늑대","북미산이리"],
                "여우": ["아메리카여우","유럽여우"]
            ],
            "고양이과":[
                "고양이": ["고양이","살쾡이"],
                "표범": ["사자","호랑이"]
            ]
        ]
]
식육목은["식육목"]!["고양이과"]!["표범"]!
