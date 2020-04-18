//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */















// 왼쪽은 0 오른쪽은 Optional
/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */


let possibleNumber = "123" //"123ㄱㄴ" 일땐 int로감싸주면 nil이나오기때문에
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)



//type(of: Int("123"))      //int일수도 아닐수도있기에 optional int로나옴
//type(of: Int(3.14))       //언제나 int로 바꿀수있기때문에 int로나옴 //더블은 인트로무조건바꿀수있음
//type(of: Int(3))




/*
 Optional Type Declaration
 
 var <#variable name#>: Type?                 // ?는 옵셔널
 var <#variable name#>: <#Optional<Type>#>
 */

var optionalType1: String?
var optionalType2: Optional<Int>

type(of: optionalType1)                   //선언한것을 찍어보면  optional<String>.type
optionalType2


// Valueless state - nil

var optionalIntInit = Optional<Int>(0)      //초기화
var optionalInt: Int? = 0                   //많이사용하는 옵셔널 표기 (?)
type(of: optionalInt)

optionalInt = nil
optionalInt


// Optional <-> NonOptional

//var nonOptional1 = nil                    // 값을 넣을때 바로nil을넣으면 오류
// int,strin,[] 타입을 정확하게 지정해줘야한다. 어디에 들어갈것인지 모르기때문에

//var nonOptional2: Int = nil
// int?는됨                           ??????뭔말이야..

//var nonOptionalType: Int = optionalInt
// ??                                   ???????


//optionalInt = 10
//optionalInt = 100
//print(optionalInt)        //옵셔널 타입은 어떤값을 넣어도 옵셔널타입으로 바뀜

//let a: Int = 0  // int        (반드시 정수만(
//var b: Int? = 1 // int or nil (정수도, 닐도 가능)
//a->b X    //b->a O

// Optional -> NonOptional (X)      // int & ni, -> int (x)
// Optional <- NonOptional (O)      // int -> int & ni (o)

/*:
 ---
 ### Question
 - Optional 헤더 살펴보기
 ---
 */


/*:
 ---
 ## Optional Biding and Forced Unwrapping
 ---
 */
//같은 옵셔널이여도 안될ㄸㅐ가 많음.

if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
  //  print("convertedNumber has an integer value of \(convertedNumber).")
}

/*:
 ---
 ### Optional Binding
 ---
 */
//옵셔널을 사용하는 방법은 아래가있다.

print("\n---------- [ Optional Binding ] ----------\n")
/*
 if let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 while let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 guard let <#nonOptional#> = <#OptionalExpression#> else {
   <#Code#>
 }
 */


let nilValue: String? = nil
let someValue = "100"

if let number = Int(someValue) {        //값이 들어가지면 trun
  print("\"\(someValue)\" has an integer value of \(number)")
} else {
  print("Could not be converted to an integer")
}



// Optional Binding - let vs var

var optionalStr: String? = "Hello, Optional"        //옵셔널타입으로선언

// let
if let optionalStr = optionalStr {      //if let으로 옵셔널상관없이 실행
//  optionalStr += "😍"
  optionalStr
} else {
  "valueless string"
}

// var
if var str = optionalStr {
  str += "😍"
  str
}



// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
  let secondNumber = Int("42"),
  firstNumber < secondNumber,
  secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


//옵셔널을 제거하기위해 if let를 사용
/*:
 ---
 ### Forced Unwrapping
 ---
 */
// ! = 강제로 옵셔널이 아닌값으로 만들어주는

/*
 let nonOptional = <#OptionalExpression!#>
 */

print("\n---------- [ Forced Unwrapping ] ----------\n")

if convertedNumber != nil {     //nil이아닐때
//  print("convertedNumber has an integer value of \(convertedNumber).")
    // 이렇게하면 옵셔널이뜨는데
  print("convertedNumber has an integer value of \(convertedNumber!).")
    // !붙여서 옵셔널이안뜸
}

// print(convertedNumber)
print(convertedNumber!)


// Forced unwrap of nil value

convertedNumber = nil
convertedNumber
//convertedNumber! // nil을 가지고있는데 실행시키면 오류가나옴. 이값은 반드시 값이있으므로 써도되 라는 값인데=! 다른상황이 발생하여 오류발생



/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */

let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error 서로다른타입이라오류발생
let forcedString: String = possibleString!  //!넣으면 강제로 변환해서 가능
type(of: possibleString)
type(of: forcedString)


var assumedString: String! = "An implicitly unwrapped optional string."
// 타입자체에 ! 붙여주는것을 = IUO. String! 옵셔널을 받을순있는데 값이있다 는 뜻
// 옵셔널 타입이긴한데 반드시 값이있는걸 보장해서 다른 문자열, 다른 타입과 쉽게 연산, 할당을 쉽게하기위해
// nil이 못들어가는 상황에서만 ! 사용, 반드시 값이있을때 사용
let implicitString: String = assumedString
let stillOptionalString = assumedString
type(of: assumedString)
type(of: implicitString)
type(of: stillOptionalString)

print(assumedString)
print(assumedString!)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입(=?) 사용
 - 프로퍼티 지연 초기화에 많이 사용
 */


/*:
 ## Nil-coalescing Operator
 */



print("\n---------- [ Nil-coalescing ] ----------\n")

optionalStr = nil

var result = ""
if optionalStr != nil {     //nil이아님을 if문으로 확인
   result = optionalStr!        //!를 붙일수있음
} else {
   result = "This is a nil value"       //nil이면 else로빠짐
}
print(optionalStr)
print(result)

// 위를 간단하게 3줄로
let anotherExpression = optionalStr ?? "This is a nil value"
//값이있으면 ano에넣고 없으면 opt에 넣겠다는 의미
print(optionalStr)
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1      //?????? ??이게무슨말?
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName       //닐일때는 레드
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName   //디폴트대신 그린으로..
print(colorNameToUse)


//옵셔널 제거는 ??이것도 가능. 닐일때 사용할 기본값을 뒤에 작성해놓는 방법으로 사용

/*:
 ---
 ### Question
 - isTrue ? a : b   와의 차이
 - optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
 ---
 */
//isTrue ? a : b 삼항연산자. 참일때 a반환 아닐때 b를반환
//  ??는 무조건 옵셔널일때 사용가능하며 nil일때 뒤에옵션을 사용하겠다.

//optionalStr ?? "This is a nil value"


//let abc = optionalStr ?? "This is a nil value"
//print(optionalStr)
//print(anotherExpression)
//
//if abc
//abc : "This is a nil value"






/*:
 ## Optional Chaining
 */

//뒤에도 연쇄적으로 옵셔널이 되어지는것.



print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

print(greeting["John"])
//존이 있을수도없을수도있어서 옵셔널 타입으로 뜬다.
print(greeting.count)
print(greeting["John"]?.count)
//앞에가 옵셔널이면 count도 옵셔널이된다.
print(greeting["NoName"])

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased())
print(greeting["Alice"]?.lowercased().uppercased())

// Optional Binding //가장대표적 //옵셔널을 제거해주고 실행해주면 옵셔널 없이뜸.
if let greetingValue = greeting["John"] {
  print(greetingValue.lowercased().uppercased())
}

/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */

print("\n---------- [ ] ----------\n")

var optionalArr1: [Int]? = [1,2,3]
var optionalArr2: [Int?] = [1,2,3]

//[Int]? = 배열이 있을수도 없을수도... = optional<Array<Int>>
//배열 자체가 옵셔널
//[Int]?] = Array안의 요소들이 Optional로 들어올 수 있다.
//배열 안에들어가는 것들이 옵셔널


var arr1: [Int]? = [1,2,3]
//arr1.append(nil)      //어레이 안에들어가는것은 정수여야 하기때문에 nildldksehla
arr1 = nil            //자체를 nil로바꾸는건가능

print(arr1?.count)      // arr1?이 자체이름이됨
print(arr1?[1])


var arr2: [Int?] = [1,2,3]
arr2.append(nil)      // [1,2,3,nil]
//arr2 = nil            // 자체는 못바꿈

//print(arr2.count)     //arr2는 옵셔널이아니여서 바로 값이나옴
//print(arr2[1])        //1번째값을꺼낼땐 안에것이 옵셔널이기때문에 옵셔널이뜸
//print(arr2.last)      //last값자체가 항상 옵셔널을 반환하기때문

let a = [1,2,3]
a.first                 // a가 1,2,3을 안줬을 경우도있기에 옵셔널로 반환함
a.last

let vv :[Int] = []
a.first                 // 이경우때문에 옵셔널반환
a.last
/*:
 ---
 ## Optional Function Types
 ---
 */


print("\n---------- [ Optional Function ] ----------\n")



var aClosure: (() -> Int?)? = {
  return 10
}

type(of: aClosure)
print(aClosure)
print(aClosure?())

aClosure?()
aClosure!()

aClosure = nil
aClosure?()
//aClosure!()



/*:
 ---
 ### Question
 - 아래 내용 참고하여 함수 정의
 ---
 */
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */

func calculateModulo(op1: Int, op2: Int?) -> Int? {
    if let oop2 = op2 {
        print(1)
    }
    return 1
}
calculateModulo(op1: 30, op2: 3)




/*:
 ---
 ### Answer
 ---
 */
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer = optionalStr != nil ? optionalStr! : "This is a nil value"
//nil이아닌게 확실하면 =optionalStr!



// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)



//: [Next](@next)
