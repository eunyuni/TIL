//: [Previous](@previous)
/*:
 # Function
 - Functions are self-contained chunks of code that perform a specific task
 - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
 - 유형
   - Input 과 Output 이 모두 있는 것 (Function)
   - Input 이 없고 Output 만 있는 것 (Generator)
   - Input 이 있고 Output 은 없는 것 (Consumer)
   - Input 과 Output 이 모두 없는 것
 */

/*
 func <#functionName#>(<#parameterName#>: <#Type#>) -> <#ReturnType#> {
   <#statements#>
 }
 */
/*:
 ---
 ## Functions without parameters
 ---
 */
// input이 없음
print("\n---------- [ Functions without parameters ] ----------\n")

print("Hello, world!")

func hello1() {
  print("Hello, world!")
}

//
func hello2() -> String {
  return "Hello, world!"
}

hello1()
print(hello2())

/*:
 ---
 ## Functions without return values
 ---
 */
// 반환값이 없는 함수
print("\n---------- [ Functions without return values ] ----------\n")

func say(number: Int) {
  print(number)
}
// void는 반환값이 없음 ()대체하거나 생략가능
func say(word: String) -> Void {
  print(word)
}

func say(something: String) -> () {
  print(something)
}

// 3개는 같음
say(number: 1)
say(word: "1")
say(something: "1")


/*:
 ---
 ## Functions with params and return values
 ---
 */
//input output둘다 있는것
print("\n---------- [ Functions with params and return values ] ----------\n")
//함수안에서만 greeting가 사용됌 / 벗어나면 greeting로 지정해준게 사라짐
func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}

greet(person: "Anna")
greet(person: "Brian")



func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

greetAgain(person: "Anna")



func addNumbers(a: Int, b: Int) -> Int {
  return a + b //한줄만 사용시 return생략 가능 , print를 붙이면 return도 붙여줘야함
}

let x = addNumbers(a: 10, b: 20) // let x = 30
let y = addNumbers(a: 3, b: 5)   // let y = 8
x + y

/*:
 ---
 ## Omit Return
 ---
 */
func addTwoNumbers(a: Int, b: Int) -> Int {
  a + b
}
addTwoNumbers(a: 1, b: 2)


/*:
---
## Function Scope
---
*/
let outside = "outside"
func scope() {
  print(outside)
  let inside = "inside"
  print(inside)
}

scope()
//print(inside) 함수안의 변수명을 밖에서 사용시 에러남. 범위가 끝나는 순간 소멸


/*:
 ---
 ## Argument Label
 ---
 */
//인수명
/*
 func functionName(<#parameterName#>: <#Type#>) {}
 */
// argumentName: 외부에서 호출 <#parameterName#>: 함수내에서사용
func someFunction(firstParam: Int, secondParam: Int) {
  print(firstParam, secondParam)
}
someFunction(firstParam: 1, secondParam: 2)


/*
 func functionName(argumentName <#parameterName#>: <#Type#>) {}
 */


// Omitting Argument Labels

func someFunction(_ firstParam: Int, secondParam: Int) {
  print(firstParam, secondParam)
}

//someFunction(firstParameterName: 1, secondParameterName: 2)
someFunction(1, secondParam: 2)
//_를 넣으면 값만 넣을수있음


// Specifying Argument Labels

func someFunction(argumentLabel parameterName: Int) {
  print(parameterName)
}

someFunction(argumentLabel: 10)

func summary(num1 a: Int, num2 b: Int) -> Int {
    a + b
} //안에서는 a,b로쓰이고 함수밖에서 따로 불러서 사용시엔 num1,num2로사용됌
summary(num1: 1, num2: 2)
// 밖에선 a,b가아니라 넘1넘2로 사용


/*:
 ---
 ### Question.
 - Argument Label을 별도로 지정하는 건 어떤 경우인가요
 ---
 */

// argumentLabel 지정 예시
func use(item: String) {
  print(item)
}
use(item: "Macbook")

func speak(to name: String) {
  print(name)
}
speak(to: "Tory")
//speak to처럼 일상적이게 보여질수있는 네임으로 사용하기 위해서
//안에서는 name라고 사용하고 밖에선 speak to로 사용하겠다는 의미

/*:
 ---
 ### Question
 - 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
 - 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
 - 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
 ---
 */
// 하단 Answer 참고
//아웃풋없이 바로 출력하는 형태
//1

func name11(a: String) -> String {
    return a
}
name11(a: "eunnn")

func ageee(a : Int) -> Int {
    return a
}
ageee(a: 11)

func namee(name a: String) -> String {
    return a
}
namee(name: "babo")


/*:
---
## Default Parameter Values
---
*/

func functionWithDefault(
  paramWithoutDefault: Int,
  paramWithDefault: Int = 12
  ) -> Int {
  return paramWithDefault
}
//기본값을 지정했을때 Parameter 생략할수 있음
functionWithDefault(paramWithoutDefault: 3, paramWithDefault: 6)
// parameterWithDefault is 6


functionWithDefault(paramWithoutDefault: 4)
// parameterWithDefault is 12


/*:
---
## Variadic Parameters
---
*/
// 타입을 그대로입력햇는데 타입뒤에 ...입력해줄수있음. 해당타입의 값을 여러개 받을 수 있다

func arithmeticAverage(_ numbers: Double...) -> Double {
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

//print(10,20,30,40,50)
//print(1,2,3,4,5,6,7)



//func arithmeticAverage2(_ numbers: Double..., _ last: Double) {       //라스트에 생략을위해 _를쓰면 에려가남
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage2(1, 2, 3, 5)


func arithmeticAverage3(_ numbers: Double..., and last: Double) {       //네임의 끝을 지정해주거나 첫번째를 지정해줘야함
  print(numbers)
  print(last)
}

arithmeticAverage3(1, 2, 3, and: 5)
arithmeticAverage3(1,2,3,4,5,6, and: 8873646)

/*:
 ---
 ## Nested Functions
 - 외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능
 ---
 */
func chooseStepFunction(backward: Bool, value: Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  
  if backward {
    return stepBackward(input: value)
  } else {
    return stepForward(input: value)
  }
}


var value = 4
chooseStepFunction(backward: true, value: value)
chooseStepFunction(backward: false, value: value)

chooseStepFunction(backward: true, value: 3)
chooseStepFunction(backward: false, value: 3)


/*:
 ---
 ### Answer
 ---
 */

func print(name: String) {
  print(name)
}
print(name: "Tory")


func printAge(_ age: Int) {
  print(age)
}
printAge(4)


func sayHello(to name: String) {
  print(name)
}
sayHello(to: "Lilly")

//: [Next](@next)
