## 191121 과제

//[ 과제 - 알고리즘 ]
//1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

```swift
var value = 7
var gaga = 0
var babo = 0
for _ in 0..<value {
    gaga += 1
    babo = babo + gaga
    print(babo)
}
```

//2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

```swift
var int = 13
var star = "*"

for threeSixNine in 1...int {
    switch threeSixNine {
    case 3, 6, 9:
        print(star)
    default:
        print(threeSixNine)
    }
//    if threeSixNine == 3 {
//        three.append(star)
//        print(three)
}
```
