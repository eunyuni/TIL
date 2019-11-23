##191191 사전과제

### 1. var 와 let의 차이점에 대해 서술하고 그 예제 코드 작성

```swift
var str = "Hello, playground"
var x:Int = 1
let y:Int = 500
x = y

var xyz:Double = 3.14
let exc:String = "hello seoul and eunyoung"
print(xyz)
```



### 2. 반복문(loop)의 종류와 1~10까지 출력하는 코드 작성

```swift
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
```



### 3. 타입추론(Type Inference)이란?

```swift
타입추론이란 지정된 타입을 변경시킬 수 없는것. - 은영(내생각)
var x : int = 1 이런경우 x는 1이라는 정수로 타입을 지정했는데
var x = 3.14 타입이 달라서 변경이 가능한 var여도 double로 타입이 다르므로 변경이 안됨.

설명- 타입추론이란 타입을 추론하는것.
데이터를 타입을 지정하지 않고 변수값을 대입했을때
자동으로 추론해서 타입을 지정함
```



### 4. 논리연산자(Boolean logic)인 AND(&&) 와 OR(||)로 나올 수 있는 경우의 수 4가지 이해하기

```
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
```

