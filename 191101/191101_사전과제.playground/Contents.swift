import UIKit

var str = "Hello, playground"
var x:Int = 1
let y:Int = 500
x = y

var xyz:Double = 3.14
let exc:String = "hello seoul and eunyoung"
print(xyz)
// xyz=exc 타입이 다르므로 안댐

/*var는 초기화시켜도 언제든 변경시킬수 있음
 let는 상수로서 변경시킬수 없음*/

if x == 2 {
    print("true")
} else {
    print("false")
}
//|| : or , && : and

if x == 1 || y == 500{
    print("true")
} else {
    print("false")
}

/* 논리연산자 or의 경우(+)
 true + true = true
 true + false = true
 false + true = true
 false + false = false */

/* 논리연산자 and의 경우(*)
 true * true = true
 true * false = false
 false * true = false
 false * false = false */

//타입추론이란 지정된 타입을 변경시킬 수 없는것. - 은영
// var x : int = 1 이런경우 x는 1이라는 정수로 타입을 지정했는데
// var x = 3.14 타입이 달라서 변경이 가능한 var여도 double로 타입이 다르므로 변경이 안됨.

//설명- 타입추론이란 타입을 추론하는것.
//데이터를 타입을 지정하지 않고 변수값을 대입했을때
//자동으로 추론해서 타입을 지정함
var age2 = 20
print(type(of : age2))

 var sdff = "google"
 print(type(of : sdff))

var a = 0
// += : a+1
 
let arrayList = [1,2,3,4,5]
for numbers in arrayList{
    print(numbers)
}

//반복문
for i in 1 ... 10 {
    print(a + i)
}
//---------------------
for i in 1 ... 10 {
    print(i)
}

let members = ["js", "ms", "jh", "hd", "ey", "jm"]

for member in members {
    print(member + " hello" )
}
print(members[0]+"hello")

//a는 10보다 작다. 값이 하나씩 증가한다.
while a < 10 {
    a += 1
}




