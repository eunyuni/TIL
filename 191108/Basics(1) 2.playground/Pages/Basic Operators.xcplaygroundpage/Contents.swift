//: [Previous](@previous)
/*:
 # Basic Operators
 */
//: [연산자 우선 순위 참고](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)
/*:
 ---
 ## Terminology
 ---
 */
let a = 123
let b = 456
let c: Int? = 789

// Unary Operator (단항 연산자) 하나의 한개만 적용.
-a

// Prefix (전위 표기법) 앞에표기되는것-
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
// ? 앞의 식이 참일때 트루 : 펄스

a > 0 ? "positive" : "zero or negative"

if a > 0 {
  "positive"
} else {
  "negative"
}

//두개가 동일하게 동작.
/*:
 ---
 ## Assignment Operators
 ---
 */
//할당연산
// Basic assignment operator
var value = 10

// Addition assignment operator
value = value + 10

// Subraction assignment operator
value = value - 5

// Multiplication assignment operator
value = value * 2

// Division assignment operator
value = value / 2

// Modulo assignment operator
value = value % 2
10 % 2  //
10 % 2  // 몫은5 나머지 0

// Compound assignment Operators
value += 1
//value = value + 1 위와같은
value -= 5
//value = value - 5
value *= 2
//value = value * 2
value /= 2
//value = value / 2
value %= 2
//value = value % 2

// 미지원 : value++ , value--

//value++ swift 지원안함
value += 1 // value+1
value = value + 1

var (x, y) = (1, 2) //x,y에 각각 할당
print(x, y)

/*:
 ---
 ## Arithmetic Operators
 ---
 */
// Unary plus opertor
+a      // +가 값의 앞에오면 양수

// Addition Operator
a + b

"Hello, " + "world"     //문자열도 더하기 가능

// Unary minus Operator
-a      //음수

// Subtraction Operator
a - b

// Multiplication Operator
a * b

// Division Operator
b / a

// Modulo operator
b % a


// 실수에서의 나눗셈
let e = 123.4
let f = 5.678

e / f
//e % f

// 실수로 나머지를 구하려면 아래것을 사용
// 나머지 구하기 1 (반올림)
e.remainder(dividingBy: f)

// 나머지 구하기 2 (내림)
e.truncatingRemainder(dividingBy: f)


// 나머지 구하기 2 의 계산 방법
let quotient = (e / f).rounded(.towardZero) //몫
let remainder = e.truncatingRemainder(dividingBy: f) //나머지
let sum = f * quotient + remainder
5.678 * 21
5.678 * 21 + 4.162000000000007
/*:
 ---
 ## Precedence
 ---
 */
//우선순위
1 + 2 * 3       //*먼저
1 + (2 * 3)     //괄호처리해줌 보기좋게
(1 + 2) * 3     //우선순위변경

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)

1 * 2 - 3
(1 * 2) - 3
1 * (2 - 3)

/*:
 ---
 ## Comparison Operators
 ---
 */

// Equal to operator
a == b      //같은지 다른지

// Not equal to operator
a != b      //같지않아야 트루

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


/*:
 ## Question
 - 숫자가 아닌 문자열에 대한 비교는?
 */
//비교연산자 asc코드,유니코드로 비교함
"iOS" > "Apple"     // IOS가더크다 그래서 ture i>a
"Application" > "Steve Jobs"    // A가더작아서 false
"Swift5" <= "Swift4"        //5 <= 4 5가 작지않고 더 커서 false
"Playground" == "Playground"    // 같아서 ture


/*:
 ---
 ## Logical Operators
 ---
 */
//논리연산자
//and가 우선순위가높음
// Logical AND Operator
true && true
true && false
false && true
false && false

// Logical OR Operator 또는~
true || true
true || false
false || true
false || false

// Logical Negation Operator 반대
!true
!false


// Combining Logical Operators
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true


// 여기서 문을 열기 위한 조건은?

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}

/*:
 ## Question
 - 논리 연산자는 순서에 주의 필요. 순서를 신경 써야 하는 이유는?
 */

func returnTrue() -> Bool {
  print("function called")
  return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?
// 우선순위 : && > ||

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue()

print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue()

print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()


/*:
 ---
 ## Range Operators
 ---
 */
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100     //0~100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100     //100보다 작은: 0~99까지

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0,1,2,3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...        //끝을 지정하지않음
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...] //2이상의 모든값
names[...2] //2까지
names[..<2] //2보다작은


/*:
 ## Question
 - 범위 연산의 순서를 반대로(내림차순) 적용하려면?
 */
// Q. 아래 코드로 테스트
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}
//반대 reversed
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}


/*:
 ---
 ### Answer
 ---
 */
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

// 5~1까지 -1로
for index in stride(from: 10, through: 1, by: -2) {
  print("\(index) times 5 is \(index * 5)")
}
print()


// 함수를 쓰지 않고 역순 구하는 방법

let range = 1...5
type(of: range)
range.lowerBound
range.upperBound

for index in range {
    // 1 ... 5
    // num = 5-1+1=5
    // num = 5-2+1=4
    // num = 5-3+1=3 ...
  let num = range.upperBound - index + range.lowerBound
  print("\(num) times 5 is \(num * 5)")
}


//: [Next](@next)
