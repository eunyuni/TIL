import UIKit


///Mark: Conditional Statements

// 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
let number: Double = 3.5

    if number >= 4.5 {
        print("A+")
    }else if number >= 4.0 {
        print("A")
    }else if number >= 3.5 {
        print("B+")
    }else{
        print("B")
        }


func credit(number: Double) -> String {
    if number >= 4.5 {
        return "A+"
    }else if number >= 4.0 {
        return "A"
    }else if number >= 3.5 {
        return "B+"
    }else{
        return "B"
    }
}

print(credit(number: 4.5))


// 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)

func englishMonth(month: Int) {
    switch month {
    case 1:
        print("Jan")
    case 2:
        print("Feb")
    case 3:
        print("Mar")
    case 4:
        print("Apr")
    case 5:
        print("May")
    case 6:
        print("Jun")
    case 7:
        print("Jul")
    case 8:
        print("Aug")
    case 9:
        print("Sep")
    case 10:
        print("Oct")
    case 11:
        print("Nov")
    default:
        print("Dec")
    }
}
englishMonth(month: 4)

// 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
// (switch where clause 를 이용해 풀어볼 수 있으면 해보기)

//var tutu = (3, 4, -5)
//
//let (a, b, c) = tutu
//let multiplication = a * b * c
//switch multiplication {
//case multiplication where multiplication >= 0 :
//    print("true")
//default:
//    print("false")
//}

func tuuu(a: Int,b: Int,c: Int) -> Any {
    let multiplication = a * b * c
    switch multiplication {
    case multiplication where multiplication >= 0 :
        return true
    case multiplication where multiplication < 0 :
        return false
    default:
        return "잘못넣음"
    }
}

print(tuuu(a: 3, b: 4, c: -5))


///Mark: Loops
///반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.


//자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//(Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//ex) 5! = 5 x 4 x 3 x 2 x 1
// .reversed 반대로 계산

//var num = 6
//var answer = 1
//
//for index in (2...num).reversed() {
//    answer = answer * index
//    print(answer)
//}

func factorial(fact: Int) {
        var answer = 1
    for index in (2...fact).reversed() {
        answer = answer * index
        print(answer)
    }
}

factorial(fact: 6)

// 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//  (2, 5 를 입력한 경우 결과는 2의 5제곱)

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
//print(sumNumbers(max: 4))

func sumNumbers(a: Int, b: Int) {
        var answer = a
    for index in 2...b {
        print("\(index)번째 for문")
        print("현재 answer의값은 \(answer)")
        answer = answer * a
        
        print("answer * a의값은:",answer)
    }
}
//sumNumbers(a: 3, b: 16)
//
//func sumNumbers(a: Int, b: Int) {
//        var answer = a
//    for index in 2...b {
//        answer = answer * a
//    }
//}
//sumNumbers(a: 3, b: 16)


// 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
// (1234 인 경우 각 자리 숫자를 합치면 10)
//


//- 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//  그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수

func sum(a: Int) {
    var answer = 0
for index in 1...a {
    answer = answer + index
    print(answer)
   if answer > 2000 {
        return }
    }
}

sum(a: 50)

//- 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수


//var answer = 0
//for fifty in 1...50 {
//    answer = answer + fifty
//    print(answer)
//    if fifty >= 20 {
//        continue
//    }else if fifty >= 21 {
//        continue
//    }else if fifty >= 22 {
//        continue
//    }else if fifty >= 23 {
//        continue
//    }else if fifty >= 24 {
//        continue
//    }else if fifty >= 25 {
//        continue
//    }else if fifty >= 26 {
//        continue
//    }else if fifty >= 27 {
//        continue
//    }else if fifty >= 28 {
//        continue
//    }else if fifty >= 29 {
//        continue
//    }else if fifty >= 30 {
//        continue
//    }else if fifty >= 31 {
//
//    }
//}

var answer = 0
for fifty in 1...50 {
    switch fifty {
        case 20 ... 30 :
            continue
        default:
            answer = answer + fifty
    }
}
print(answer)

func answer1() {
    answer = 0
    for fifty in 1...50 {
        switch fifty {
            case 20 ... 30 :
                continue
            default:
                answer = answer + fifty
        }
    }
    print(answer)
}
answer1()


//- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)


//- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func letter(a: String, b: String) -> Bool {
    if a == b {
        return true
    }else{
        return false
    }
}

letter(a: "하", b: "하")
letter(a: "aab", b: "bb")
letter(a: "gg", b: "gg")

//- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func yaksu(a: Int) {
    for index in 1...a {
        if a % index == 0 {
            print(index)
        }
    }
}

yaksu(a: 100)
