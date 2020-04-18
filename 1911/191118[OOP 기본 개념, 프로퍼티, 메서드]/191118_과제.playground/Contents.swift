//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//   구현 내용은 자유롭게
// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기
// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기
// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송
// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지

class Dog {
    var name = "미미"
    var age = 3
    var weight = 10
    var type = "스피치"
    
    func mung() {
        print("짖는당")
    }
    func eat() {
        print("먹는당")
    }
}
let abbb = Dog()
abbb.mung()
abbb.eat()

class Student {
    var name = "은영"
    var age = 19
    var school = "패캠고등학교"
    var grade = "1학년"
    
    func study() {
        print("공부한당")
    }
    func eat() {
        print("먹는당")
    }
    func sleep() {
        print("잠잔당ㅋ")
    }
}
let abbc = Student()
abbc.study()
abbc.eat()
abbc.sleep()

//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
// ex)
// let calculator = Calculator() // 객체생성
//
// calculator.value  // 0
// calculator.add(10)    // 10
// calculator.add(5)     // 15
//
// calculator.subtract(9)  // 6
// calculator.subtract(10) // -4
//
// calculator.multiply(4)   // -16
// calculator.multiply(-10) // 160
//
// calculator.divide(10)   // 16
// calculator.reset()      // 0
class Calculator {
    var number : Int
    var number1 : Int
    
    init(number: Int, number1: Int) {
        self.number = number
        self.number1 = number1
    }
    
    func add() -> Int {
        return number + number1
    }
    func subtract() -> Int {
        return number - number1
    }
    func multiply() -> Int {
        return number * number1
    }
    func divide() -> Int {
        return number / number1
    }
}

let calculator = Calculator(number: 10, number1: 5)
calculator.add()
calculator.subtract()
calculator.multiply()
calculator.divide()

class Calculator1 {
    var value = 0
    
    func add(_ a: Int) -> Int {
        value += a
        return value
    }
    func subtract(_ a: Int) -> Int {
        value -= a
        return value
    }
    func multiply(_ a: Int) -> Int {
        value *= a
        return value
    }
    func divide(_ a: Int) -> Int {
        value /= a
        return value
    }
    func reset() -> Int{
        return 0
    }
}

let cal = Calculator1()
cal.value
cal.add(10)
cal.add(5)
cal.subtract(9)  // 6
cal.subtract(10) // -4
cal.multiply(4)   // -16
cal.multiply(-10) // 160
cal.divide(10)   // 16
cal.reset()



//3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
//Collapse

class Square {
    var value : Int = 0
    
    func area(value: Int) -> Int {
        return value * 2
    }
    func circumference(value: Int) -> Int {
        return value * 4
    }
}
let square = Square()
square.area(value: 4)
square.circumference(value: 5)


class Rectangle {
    var width : Int = 0
    var height : Int = 0
    
    func area(width: Int, height: Int) -> Int {
        return width * height
    }
    func circumference(width: Int, height: Int) -> Int {
        return (2 * width) + (2 * height)
    }
}
let rectangle = Rectangle()
rectangle.area(width: 4, height: 5)
rectangle.circumference(width: 8, height: 9)

class Circle {
    var width : Double = 0
    var height : Double = 0
    
    func area(width: Double) -> Double {
        return Double(width * 2 * 3.14)
    }
    func circumference(width: Double) -> Double {
        return Double(width * width * 3.14)
    }
}
let circle = Circle()
circle.area(width: 3.0)
circle.circumference(width: 3.0)

class Triangle {
    var width : Int = 0
    var height : Int = 0

    func area(width: Double, height: Double) -> Double {
        return width * height * (Double(1)/Double(2))
    }
}

let triangle = Triangle()
triangle.area(width: 4, height: 4)

class Trapezoid {
    var width : Int = 0
    var height : Int = 0
    var higt : Int = 0

    func area(width: Double, height: Double, high: Double) -> Double {
        return (Double(1)/Double(2)) * height * (width * high)
    }
}

class Cube {
    var width : Int = 0

    func area(width: Int) -> Int {
        width * 3
    }
}

class RectangularSolid {
    var width : Int = 0
    var height : Int = 0
    var higt : Int = 0
    
    func area(width: Int, height: Int, high: Int) -> Int {
        width * height * high
    }
}

class CircularCylinder {
    var width : Int = 0
    var height : Int = 0
    
    func area(width: Double, height: Double) -> Double {
        Double(3.14 * width * 2 * height)
    }
}

class Sphere {
    var width : Int = 0
    
    func area(width: Double) -> Double {
        (Double(4)/Double(3)) * 3.14 * width * 3
    }
}

class Cone {
    var width : Int = 0
    var height : Int = 0
    
    func area(width: Double, height: Double) -> Double {
        (Double(1)/Double(3)) * 3.14 * width * 2 * height
    }
}







