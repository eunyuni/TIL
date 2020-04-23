import UIKit

// MARK: -struct
/************************
 struct를 사용할때 고려할점
 -여러개의 인스턴스를 생성
 -짧은기간, 시간에만 존재하는지
 -일단 struct로 시작하고 나중에 필요해의하면 class로 전환.. ㅎ
 -속도가빠르기때문..
 -wwdc에서 struct로 사용하는것을 권장한다고함~
 
 장점!
 -value types,
 -copy
 -immutable 하므로 내부의 데이터를 수정하려면 뮤티이팅 필요
 -스택저장으로 빠름
 ************************/

struct PersonStruct {
  var firstName: String
  var lastName: String
  
  // 자기자신의 프로퍼티를 변경하려고 하므로 새로운 카피를 만들어낸다고생각 mutating를 이용해서 풀어줌
  // 현재값을 새로운 값으로 할당함을 알려줌 -> mutating
  mutating func uppercaseName() {
    firstName = firstName.uppercased()
    lastName = lastName.uppercased()
  }
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}


// MARK: -class
/************************
 장점!
 -reference types
 -share!
 -주소를 값으로 가짐
 -objects를 표현하기좋음
 -mutable하기때문에 뮤테이팅 필요 없음
 -heap에 저장되므로 조금느림
 -지정 init이 필요함(required)
 -상속관계에서 자식이 따로 init을 만들지 않으면 자동으로 부모의 지정init을 사용
 ************************/

class PersonClass {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  // 클래스에서는 자기자신을 변경할수 있다.
  func uppercaseName() {
    firstName = firstName.uppercased()
    lastName = lastName.uppercased()
  }
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}



// MARK: -Struct, Class 예시

var person1 = PersonStruct(firstName: "Jason", lastName: "Lee")
let person2 = person1

// struct -> 서로독립적인존재 변경을해도 독립적이여서 반영되지 않음
person1.firstName = "Jay"
person1.firstName
person2.firstName


var person3 = PersonClass(firstName: "Jason", lastName: "Lee")
var person4 = person3

// class -> 주소가 같아서 변경을 하면 같은 인스턴스를 가리키므로 전부변경됨
person3.firstName = "Anna"
person3.firstName
person4.firstName
person4.firstName = "Mike"
person3.firstName
person4.firstName

person4 = PersonClass(firstName: "Bob", lastName: "Lee")
person4.firstName
person3.firstName

person4 = person3
person3.firstName


// MARK: -Inheritance 상속
/****************************
A클래스의 내용을 포함시켜서 B클레스를 만들때
 -Person: Base Class(Super Class, Parent Class)
 -Student: SubClass
 * Rual
 -1개의 Base Class만 상속 받을 수 있음
 -상속의 깊이는 상관 없음(할머니 클래스를 엄마가 받고 엄마가 자식을 받을수 있다는 말)
 ****************************/


struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}


class Person {
  var firstName: String
  var lastName: String
  
  // 지정된 init을 만들때는 required를 붙여준다.
  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func printMyName() {
    print("My name is \(firstName) \(lastName)")
  }
}


class Student: Person {
  var grades: [Grade] = []
  
  // 지정된 init을 생성
  required init(firstName: String, lastName: String) {
    super.init(firstName: firstName, lastName: lastName)
  }
  
  // 지정된 인잇을 좀더 간단하게 만드는 역활을 한다.
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName, lastName: transfer.lastName)
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
  
}


let eunyuni = Person(firstName: "Eunyuni", lastName: "Kim")
let juddong = Student(firstName: "Juddong", lastName: "Kim")

eunyuni.firstName
juddong.firstName


eunyuni.printMyName()
juddong.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3.0)
let history = Grade(letter: "A", points: 10.0, credits: 3.0)
juddong.recordGrade(math)
juddong.recordGrade(history)

juddong.grades.count

juddong.recordGrade(Grade(letter: "A", points: 4.8, credits: 2.0))
juddong.grades.count
juddong.grades

// 운동하는 학생
class StudentAthlete: Student {
  var minimumTrainingTime: Int = 2
  var trainedTime: Int = 0
  var sports: [String]
  
  required init(firstName: String, lastName: String) {
    self.sports = []
    super.init(firstName: firstName, lastName: lastName)
  }
  
  // super.init을 해주지않으면 부모클래스의 프로퍼티에 접근할 수 없다.
  init(sports: [String], firstName: String, lastName: String) {
    self.sports = sports
    super.init(firstName: firstName, lastName: lastName)
  }
  
  func train() {
    trainedTime += 1
  }
}

// 운동중에 축구하는 학생
class FootballPlayer: StudentAthlete {
  var footballTeam = "FC Swift"
  
  // 기존상속받은 함수를 새롭게 정의하고자 할 때!
  override func train() {
    trainedTime += 2
  }
}


var athlete1 = StudentAthlete(firstName: "YN", lastName: "Kim")
athlete1.trainedTime
athlete1.train()
athlete1.trainedTime

var athlete2 = FootballPlayer(firstName: "HM", lastName: "Son")
athlete2.trainedTime
athlete2.train()
athlete2.trainedTime
athlete2.footballTeam


// 클래스를 상속받는 함수도 새성가능
func printFirstName(_ person: Person) {
  print("---> first name: \(person.firstName)")
}
printFirstName(eunyuni)
printFirstName(athlete2)

// 자식을 부모로 바꿀때 캐스팅을 시도
athlete1 = athlete2 as StudentAthlete
athlete1.train()
athlete1.trainedTime

// 부모를 자식으로 다운캐스팅을 시도
if let son = athlete1 as? FootballPlayer {
  print("---> name:\(son.lastName), team: \(son.footballTeam)")
}


