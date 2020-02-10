//: [Previous](@previous)
/*:
 # Loops
 - For-In Loops
 - While Loops
   - while
   - repeat-while
 */
/*:
 ---
 ## For-In Loops
 ---
 */
print("\n---------- [ for ] ----------\n")
/*
 for <#item#> in <#items#> {
 <#code#>
 }
 */

//하나의 값을 반복문으로 돌리는게 아니라

//for (int i = 0; i <= 5; i++) {
//   C 스타일의 for 문
//}

for index in 1...4 {
  print("\(index) times 5 is \(index * 5)")
}
//1~4를 index에 담아서 사용



// Wildcard Pattern
// 값을 반복만 하고싶을때
for _ in 0...3 {    //for index in 0...3 -> 인덱스 사용을안하므로 오류뜸
  print("hello")
}
//변수가 사용된게 아니라 4번만 반복시키고 싶음

for chr in "Hello" {
 //  print(chr, terminater: \(n))
    print(chr, terminator: " ")
}
print()

let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}
// 그냥바로 print하면 ["Swift", "Programming", "Language"] 요래나옴

/*:
 ---
 ### Question
 - for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
 - for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
 ---
 */
// 하단 Answer 참고

//let base = 3
//let power = 10
//var answer = 1
//
//for _ in 1...power {
//    answer *= base
//}
//print("\(base) to the power or \(power) is \(answer)")


    let base = 3
    let power = 10
    var answer = 1

    for _ in 1...power {
      answer *= base
    }
    print("\(base) to the power of \(power) is \(answer)")


for num in (1...10).reversed() {
  print(num, terminator: " ")
}
print()


/*:
 ---
 ## While Loops
 - 조건이 거짓이 될 때까지 일련의 명령문 수행
 - 첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용
 - while  /  repeat-while
 ---
 */
print("\n---------- [ while ] ----------\n")
/*
 while <#condition#> {
 <#code#>
 }

 - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
 */

var num = 0
var sum = 0

while num <= 100 {      //true면 계속 반복하다는 뜻임
  sum += num            // 0+0
  num += 1              // 0+1 100미만까지 계속 반복
}


/*:
 ---
 ### Question
 - 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
 ---
 */
// 하단 Answer 참고

//let three = 3
//
//for answer in 1...10 {
//    var multiplication = answer * three
//    var multi = multiplication * answer
//    return multi
//    print("\(three) 곱하기 \(answer)은 \(multi)")
//}

func sumNumbers(max: Int) -> Int {
  var num = 1
  var sum = 0
  repeat {
    sum += num      // 0 = 0 + 1
    num += 1        // 1 = 1 + 1
  } while num <= max    // 조건 1이 <= 맥스까지
  
  return sum
}
print(sumNumbers(max: 4))



/*
 repeat {
 <#code#>
 } while <#condition#>
  
*/



print("\n---------- [ repeat ~ while ] ----------\n")

func printMultiplicationTable1(for number: Int) {
  var i = 1
  repeat {
    print("\(number) * \(i) = \(number * i)")
    i += 1
  } while i <= 9
}

printMultiplicationTable1(for: 3)

/*:
 ---
 ### Question
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
 ---
 */
func summm(max: Int) -> Int {
    var a = 0
    var b = a + 1
    repeat {
        a += b
        b += 1
} while b <= max
    return b
}

 summm(max: 4)

/*:
 ---
 ### Answer
 ---
 */

// for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
//let base = 3
//let power = 10
//var answer = 1

for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")



// for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
for num in (1...10).reversed() {
  print(num, terminator: " ")
}
print()


// 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
func printMultiplicationTable(for number: Int) {
  var i = 1
  while i <= 9 {        //9번을 반복
    print("\(number) * \(i) = \(number * i)")
    i += 1              //10이되면 멈추는
  }
}

printMultiplicationTable(for: 3)


// 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
//func sumNumbers(max: Int) -> Int {
//  var num = 1
//  var sum = 0
//  repeat {
//    sum += num
//    num += 1
//  } while num <= max
//
//  return sum
//}

sumNumbers(max: 10)
sumNumbers(max: 50)
sumNumbers(max: 100)




func summ(max: Int) -> Int {
    var num = 1
    var sum = 0
    repeat {
        sum += num
        num += 2
    }while num <= max

    return sum
}
summ(max: 55)
//: [Next](@next)

