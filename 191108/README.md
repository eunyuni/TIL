## 191108 함수과제

```swift
print("\n--------------- [ 1 ] ---------------\n")
//- ㄴ 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func nameAge(name: String) -> String {
    let namgAge1 = "My name is " + name + "years old."
    return namgAge1
}
nameAge(name: "mike 19")
print(nameAge)

func nameAge1(name: String, age: Int) -> String {
    return "My name is \(name) \(age) years old."
}

print(nameAge1(name: "mike", age: 19))


print("\n--------------- [ 2 ] ---------------\n")
//- 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

//func order1(a: Int, b: 2) -> Bool {
//    if a / b == 0 {
//        return true
//    }else{
//        return false
//    }
//}

func order(a: Int) -> Bool {
    if a % 2 == 0 {
        return true
    }else{
        return false
    }
}
order(a: 5)
print(order(a: 5))


print("\n--------------- [ 3 ] ---------------\n")
//- 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func result(a1: Int, a2: Int = 10) -> Int {
  return a1 * a2
}
result(a1: 5)
print(result(a1: 5))


print("\n--------------- [ 4 ] ---------------\n")
//- 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func average1(_ subjects: Double...) -> Double {
  var total1 = 0.0
  for subject in subjects {
    total1 += subject
  }
  return total1 / Double(subjects.count)
}

average1(23, 40, 80, 99)
average1(70, 89, 99, 60)

func average2(math: Double...) -> Double {
  var total = 0.0
  for suv in math {
    total += suv
  }
  return total / Double(math.count)
}

average2(math: 33, 44, 55, 7)


print("\n--------------- [ 5 ] ---------------\n")
//- 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

//var math = 85
//var score = ""
//
//if math >= 90 && math < 100 {
//  score = "A"
//} else if score < 79 {
//  score = "B"
//} else if score < 69 {
//  score = "C"
//} else {
//  score = "D"
//}

func num(a: Int) -> String {
    if a > 89 {
        return "A"
    }else if a > 79 {
        return "B"
    }else if a > 69 {
        return "C"
    }else {
        return "F"
    }
}
    
num(a: 70)


print("\n--------------- [ 6 ] ---------------\n")
//- 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)


func credit(_ subjects: Double...) -> String {
  var total1 = 0.0
  for subject in subjects {
    total1 += subject
  }
    let average8 = total1 / Double(subjects.count)
    

    if average8 >= 90 {
      return "A"

  }else if average8 >= 80 {
      return "B"
  }else if average8 >= 70 {
      return "C"
  }else {
      return "F"
  }
}

credit(100, 100, 50, 80)


func average3(math: Double...) -> Double {
  var total = 0.0
  for suv in math {
    total += suv
  }
  return total / Double(math.count)
}

average3(math: 33, 44, 55, 7)

func numm(a: Int) -> String {
    if a > 89 {
        return "A"
    }else if a > 79 {
        return "B"
    }else if a > 69 {
        return "C"
    }else {
        return "F"
    }
}
```



