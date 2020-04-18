
//[ 과제 ]
//1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

func combineString(str1: String?, str2: String?, str3: String?) -> String? {
    if let combo = str1, let combo1 = str2, let combo2 = str3 {
        print(combo + combo1 + combo2)
        let unwrappedString = combo + combo1 + combo2
        return unwrappedString
    } else {
        return nil
    }
}
combineString(str1: "ha", str2: "PP", str3: "ho")


// 입력 예시 및 결과
//combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
//combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"



//2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현

//enum Arithmetic {
//  case addition, subtraction, multiplication, division
//}

 enum Arithmetic {
   case addition, subtraction, multiplication, division
    
    func abc(a: Int, b: Int) -> Double {
        switch self {
        case .addition:
            return Double(a + b)
        case .subtraction:
            return Double(a - b)
        case .multiplication:
            return Double(a * b)
        case .division:
            return Double(a) / Double(b)
        }
    }
 }

var eun = Arithmetic.division
eun.abc(a: 7, b: 2)

