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
