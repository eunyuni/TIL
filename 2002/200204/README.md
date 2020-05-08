# Algorithm

## Bubble Sort (버블 정렬)

```swift
var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]


 ---
정렬 함수 구현
 ---

// 안에서 바꾼것이 바깥도 적용이되는것 -> inout, let로따로 저장할 필요가없음 바로변경이 가능하며 바깥에도 영향을 미치게됌
func someFunction(input: inout [Int]) {
  input = [1,2]
}
var someArr = [1,2,3]
someFunction(input: &someArr)
//-------------------------------------------


// [1, 2, 5, 4, 3] // 미정렬 상태
// [1, 2, 4, 3, 5] // 1회
// [1, 2, 3, 4]    // 2회
// [1, 2, 3]
func bubbleSort(input: inout [Int]) {
  guard !input.isEmpty else { return }
  
  // input.count = 5
  // i = 1
  // i = 2
  for i in 1..<input.count {
    // 정렬이 완료됐을때 바로종료시키기위해..
    var isSorted = true
    
    // for idx in 0..<5-1 { }
    // for idx in 0..<5-2 { }
    for idx in 0..<input.count - i { // 맨끝은 가장큰수로 제외하고 나머지를 비교함(input.count - i)
      // -i를 해줌으로써 맨마지막에 정렬된 가장큰숫자들을 불필요하게 또다시 정렬을 하지않게끔 해줌
      guard input[idx] > input[idx + 1] else { continue }
      input.swapAt(idx, idx + 1) // 두개의 수를 비교해서 비교한 수가 컸을때 continue하지않고 실행하는.. ㅡㅡ
      isSorted = false  // 정렬이 안됐으면 이부분을 넘겨서 다시실행하게끔
    }
    guard !isSorted else { break}
  }
}

 ---
 ### 결과 확인
 ---

// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
  bubbleSort(input: &inputCases[idx])
}

// 결과 비교. 정렬 완료가 나오면 성공
func testCases() {
  inputCases.enumerated().forEach { idx, arr in
    guard sorted[idx] != arr else { return }
    print("케이스 \(idx + 1) 정렬 실패 - \(inputCases[idx])")
  }
}
let isSuccess = sorted == inputCases
isSuccess ? print("정렬 완료") : testCases()

```



##  Selection Sort (선택 정렬)

```swift
var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 1, 2, 3],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]

 ---
 ### 정렬 함수 구현
 ---
 
//  0  1  2  3   4  5
// [5, 6, 1, 3, 10, 2, 7, 14, 9] // 시작
// [1, 6, 5, 3, 10, 2, 7, 14, 9] // 1회차
// [1] 고정 [2, 5, 3, 10, 6, 7, 14, 9] // 2회차, 제일작은 1을 찾았기에 1번째자리인 1은 고정으로두고 나머지를 비교해서 작은값과 변경
// [1, 2] 고정 [5, 3, 10, 6, 7, 14, 9] // 3회
func selectionSort(input: inout [Int]) {
  for i in input.indices {
    var minIndex = i
    for idx in (i + 1)..<input.count { //
      guard input[minIndex] > input[idx] else { return } //
      minIndex = idx  // 배열이끝날때까지 idx값을 찾음
      // 작은값을 저장해뒀다가 작은값과 맨앞의 값을 교환하는 방식
    }
    input.swapAt(i, minIndex)
  }
}


---
### 결과 확인
---

// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
  selectionSort(input: &inputCases[idx])
}

// 결과 비교. 정렬 완료가 나오면 성공
func testCases() {
  inputCases.enumerated().forEach { idx, arr in
    guard sorted[idx] != arr else { return }
    print("케이스 \(idx + 1) 정렬 실패 - \(inputCases[idx])")
  }
}
let isSuccess = sorted == inputCases
isSuccess ? print("정렬 완료") : testCases()
```

