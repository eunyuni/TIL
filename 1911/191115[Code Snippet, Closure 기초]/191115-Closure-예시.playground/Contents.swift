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
