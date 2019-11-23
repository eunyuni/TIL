## 191115 사전과제

### [ 자율 학습 ]

1. 지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
2. 클로저 Full Syntax <-> Optimized Syntax 변환 연습[ 과제 ]
1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기



```swift
// 입력된 문자열의 개수를 반환하는 클로저를 함수의 파라미터로 전달하는 예
func performClosure(param: (String) -> Int) {
  param("Swift")
}

// 클로저를 선언
performClosure(param: { (str: String) -> Int in
  return str.count
})

// 반환해야할 타입을 생략 // 클로저 반환타입을 생략
performClosure(param: { (str: String) in
  return str.count
})

// 클로저 아규먼트 타입 생략
performClosure(param: { str in
  return str.count
})

// 클로저 아규먼트 생략
performClosure(param: {
  return $0.count
})

// 리턴 생략
performClosure(param: {
  $0.count
})

// () 앞으로 당김
performClosure(param: ) {
  $0.count
}

// 함수의 아규먼트 이름 생략
performClosure() {
  $0.count
}

// ()생략
performClosure { $0.count }
```

