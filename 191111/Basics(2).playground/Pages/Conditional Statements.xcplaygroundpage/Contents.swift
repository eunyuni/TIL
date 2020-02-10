//: [Previous](@previous)
/*:
 # Conditional Statements
 */

/*:
 ---
 ## if Statements
 ---
 */
/*
 if <#condition#> {
   <#code#>
 }
 실행이 되거나 말거나
 
 if <#condition#> {
   <#statements#>
 } else {
   <#statements#>
 }
 
 - condition 은 Bool 값 (true, false)
 else 참이아닐때!
 */

// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}
//화씨가 30도일때 32보다 작거나 같다.

// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if: 실행이안되는 경우가 생길 수 있음

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}
//if문도 만족안하고, 그아래도 만족을 안해서 아무것도 출력이 안됨.


// true && true = true
// true && false = false

// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

// Logical And Operator
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 {
}

// Logical Or Operator
if temperatureInFahrenheit > 0 || temperatureInFahrenheit % 2 == 0 {
}
//&& = , 대신쓸 수 있음
/*:
 ---
 ### Question
 - if ~ else if   /  if 문을 2개 하는 것과 차이점?
 - if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
 ---
 */

// if ~ else if   /  if 문을 2개 하는 것과 차이점?
// if한번쓸땐 두개가 답이여도 뒤에 else를 무시하고 출력 / 2개하면 각각 실행됨

var number = 9
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
}

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다")
}



// if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
// else if 의 값이 아니였을때 else없이 else의 답이 뜨게하려면?

number = 25

if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else {
  print("20과 같거나 크다")
}


if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else if number >= 20 {
  print("20과 같거나 크다")
}

//  else if number >= 20 {
//  print("20과 같거나 크다")
//}

// else의 답에 해당되는 조건을 넣는다.

/*:
 ---
 ## switch Statements
 ---
 */
/*
 switch <#value#> {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 value : 처음 평기할 대상을 넣음 = case와 같은타입으로 넣어줌
 case : value가 나올수있는 경우의 수를 넣어줌
 default : else같음
 case 에서 모든경우를 다룰경우 디폴트 없어도됨.
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 */

print("\n---------- [ switch statements ] ----------\n")

let alphabet: Character = "a"

switch alphabet {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  break //안하고 빠져나올때
//  print("Some other character") / break대신 넣어도됨
}


// Without default case

let isTrue = true
type(of: isTrue)

switch isTrue {
case true:
  print("true")
case false:
  print("false")
}
// 나머지 값이 없기에 default 생략가능


// Interval Matching

print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 30

switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}
//범위로 값이 속하면 처리도 가능


/*:
 ---
 ### Question
 - 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
 ---
 */
// 하단 Answer 참고

 if temperatureInFahrenheit <= 32 {
 print("It's very cold. Consider wearing a scarf.")
 } else if temperatureInFahrenheit >= 86 {
 print("It's really warm. Don't forget to wear sunscreen.")
 } else {
 print("It's not that cold. Wear a t-shirt.")
 }


let temper = 72
switch temper {
case 0...32:
    print("It's very cold. Consider wearing a scarf.")
case 32...86:
    print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}


// Compound Cases

// if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}
// 5개중 하나여도 케이스에 해당


// value binding = 튜플이라고함

// x, y 좌표
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):      // case (x,y)
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}
// somePoint평가를 할건데, (let distance, 0)변수로 가지고있는데 값은 정해져있지않다.
// x,y가 0일때만 case가 출력



// where clause

let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:       //밖에 let가능, 둘다 변수로 받음 where=if
    //x,y가 같으면 여기로
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    //x,y가 값은 같지만 음수일때 여기로
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    //나머지는 여기
  print("(\(x), \(y)) is just some arbitrary point")
}

//switch의 if문 = where

/*:
 ---
 ### Question
 - 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
 ---
 */
// 하단 Answer 참고

let number2 = 345354332
switch number2 {
case number2 where number2 % 2 == 0:
    print("짝")
default:
    print("홀")
}


// fallthrough


print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 10
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also" //소수에 해당하면 뒤에 붙이고
    fallthrough
// 아래 case까지 실행되도록 하는 명령어 (첫번째 케이스에 해당시 아래것이 원래는 적용이안됨)
default:
    description += " an integer."
}
print(description)



/*:
 ---
 ## Early Exit
 - guard statement
 ---
 */
//만족하지 않으면 빠르게 종료.

/*
  
 */

//func update(age: Int) {
//  if 1...100 ~= age {
//    print("Update")
//  }
//}
//update(age: 80)

//func update(age: Int) {                    //switch 문으로 표현
//  switch age {                             //특정기능을 만족할때 사용
//  case 1...100: print("Update")
//  default: break
//  }
//}

func update(age: Int) {                   //grard 문으로 표현
  guard 1...100 ~= age else { return }    //else경우 종료시킴.
  print("Update")
}

update(age: -1)
update(age: 2)
update(age: 100)


func someFunction() {
  // ...
  // ...
  
  // if 문의 조건이 맞으면 어떤 코드를 수행할 것     //이값을 수행해도되고 안해도되고
  if Bool.random() {
    // ...
  }

  // gaurd문의 조건을 만족할 때만 다음으로 넘어갈 것      //무조건 만족해야만 넘어감!
  guard Bool.random() else { return }
  
  // ...
  // ...
}




/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

// if - else if - else 문을 switch 문으로 바꿔보세요.
switch temperatureInFahrenheit {
case ...32:
  print("It's very cold. Consider wearing a scarf.")
case 86...:
  print("It's really warm. Don't forget to wear sunscreen.")
default:
  print("It's not that cold. Wear a t-shirt.")
}



// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
let even = 4
switch even {
case let x where x.isMultiple(of: 2):  //isMultiple(of: 2) = 2의 배수인지
  print("\(x)는 짝수")
default:
  print("홀수")
}


//: [Next](@next)
