//: [Previous](@previous)
/*:
 # Literals & Types
 * 리터럴
   - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
   - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등
 */

/*:
 ---
 ## Numeric Literals
 ---
 */
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger)

let decimalInteger = 17
let binaryInteger = 0b10001
type(of: binaryInteger)

let octalInteger = 0o21
let hexadecimalInteger = 0x11

var bigNumber = 1_000_000_000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF

/*:
 ---
 ## Integer Types
 *  8-bit : Int8, UInt8
 * 16-bit : Int16, UInt16
 * 32-bit : Int32, UInt32
 * 64-bit : Int64, UInt64
 * Platform dependent : Int, UInt (64-bit on modern devices)
 ---
 */
// 기본 Int타입의 크기?
// Int64 1word = 64bit -> CPU

var integer = 123
integer = -123
type(of: integer)

var unsignedInteger: UInt = 123
type(of: unsignedInteger)


MemoryLayout<Int>.size //8 8 8 = 64bit
//int의 size
Int.max  // 2^63 -1 (0이 있으니까)
Int.min  //-2^63

MemoryLayout<UInt>.size //8 8 8 = 64bit
UInt.max  // 2^64-1
UInt.min  // 0

MemoryLayout<Int8>.size
Int8.max
Int8.min

MemoryLayout<UInt8>.size
UInt8.max
UInt8.min

MemoryLayout<Int16>.size
Int16.max
Int16.min

MemoryLayout<UInt16>.size
UInt16.max
UInt16.min

MemoryLayout<Int32>.size
Int32.max
Int32.min

MemoryLayout<UInt32>.size
UInt32.max
UInt32.min

MemoryLayout<Int64>.size
Int64.max
Int64.min

MemoryLayout<UInt64>.size
UInt64.max
UInt64.min
print(UInt64.max)   // 18,446,744,073,709,551,615


/*:
 ---
 ### Question
 - UInt에 음수를 넣으면?
 - Int8 에 127 을 초과하는 숫자를 넣으면?
 - Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?
 ---
 */
//let q1: UInt8 = -1
//8 8 8 = 64bit

//let q2: Int8 = Int8.max + 1
//let q2: Int8 = 127 + 1
// 128을 담을수 없어서 에러:미리 컴파일러가 실행못함을 알려줌(컴파일에러)
//let q2 = Int8(127 + 1)
// 아래에서 에러메세지뜸: ()안에있어서 실행도중에 Int8로 변환을 시도하는데 변환이안되서 오류가 (런타임에러)로 발생

//Int32.max
//Int64.max + 1

Int32.max
Int64.max
let q3 = Int(Int32.max) + 1

//let q3 = Int(Int32.max) + 1
//Int 64=Int(int32.max) = 오류가발생안하
//Int32.max + 1
//Int64.max + 1 을 사용하게 될 경우를 생각해라.


/*:
 ---
 ## Overflow Operators
 ---
 */

//개념만 알아두셈
// 아래 각 연산의 결과는?

// Overflow addition
//var add: Int8 = Int8.max + 1
Int8.max // 01111111
var add: Int8 = Int8.max &+ 1 // &에러를 무시하고 1을 추가할것이다/
//

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1


// 01111111
// 10000000 = Int8.min


// Overflow subtraction
//var subtract: Int8 = Int8.min - 1
var subtract: Int8 = Int8.min &- 1 // min이니까 -인데 -1이 부호를 바꿔주고 최대값에서 바꿔줬떠니 양수의 최대값으로 바뀜

Int8.min &- 1
Int32.min &- 1
Int64.min &- 1

// 10000000
// 01111111= Int8.max

Int8.min // 1000000
Int8.max // 0111111


// Overflow multiplication
//var multiplication: Int8 = Int8.max * 2
var multiplication: Int8 = Int8.max &* 2

Int8.max &* 2
Int32.max &* 2
Int64.max &* 2



/*:
 ## Floating-point Literal
 */
var floatingPoint = 1.23 // 더블타입으로 받아들임
floatingPoint = 1.23e4 // e는 ^승
floatingPoint = 0xFp3
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23 //더블보다 작은것(좀더 작은 실수를 명시할때 나타내는 타입)
type(of: floatValue)

//실수는 플로트, 더블로 나타낼 수 있다.
MemoryLayout<Float>.size //4바이트
Float.greatestFiniteMagnitude   // FLT_MAX(예전버전)
Float.leastNormalMagnitude   // FLT_MIN

MemoryLayout<Double>.size //8바이트
Double.greatestFiniteMagnitude   // DBL_MAX
Double.leastNormalMagnitude   // DBL_MIN


/***************************************************
 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
 Float - 최소 소수점 이하 6 자리수 이하의 정밀도
 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음
 ***************************************************/

/*:
 ---
 ## Boolean Literal
 ---
 */
var isBool = true // 참거짓
type(of: isBool)

isBool = false //전부소문자
//isBool = False
//isBool = 1
//isBool = 0


/*:
 ---
 ## String Literal
 ---
 */
let str = "Hello, world!"
type(of: str)

let str1 = "" //아무것도 없어도 String으로인식
type(of: str1)

var language: String = "Swift"

/*:
 ---
 ## Character Literal
 ---
 */

var nonCharacter = "C" //기본은 String
type(of: nonCharacter)

var character: Character = "C" //Character 타입은 명시를 해줘야함
type(of: character)

MemoryLayout<String>.size
MemoryLayout<Character>.size
//둘이 숫자는 같아도 실제로 차지하는 메모리의 숫자는 다름

//character = ' ' swift는 안됌
//character = ""  하나의 문자도 표현하지않기때문에 캐릭터에 넣을수없다.
//character = "string" 여러개의 문자도 캐릭터에 안돼. 캐릭터는 무조건 하나
character = " "



let whiteSpace = " "
type(of: whiteSpace)


/*:
 ---
 ## Typealias
 - 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
 ---
 */
// typealias <#type name#> = <#type expression#>
// 타입별칭을 지어줌

typealias Index = Int
//인덱스라는 이름으로 사용하고싶어
let firstIndex: Index = 0
let secondIndex: Int = 0
//인트대신 인덱스로 활용할수있음.
type(of: firstIndex)
type(of: secondIndex)


//: [Next](@next)
