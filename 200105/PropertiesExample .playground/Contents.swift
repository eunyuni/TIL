import UIKit

//프로퍼티: 값을 들고있다.
//만약 메소드가 값을 하나 띡 리턴하는경우라면? -> Method

struct Person {
    
    // 저장 프로퍼티: 값을 저장할때 사용하는 프로퍼티
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    // 프로퍼티 옵저버
    var firstName: String {
        didSet {
            // firstName가 변경됐을때 여기를 수행해라
            // 이미 셋팅이 되고난 후 수행
            // willset는 셋팅이 되기 전 수행
            // 스토어드 프로퍼티에 한해 동작함
            // 처음 init될땐 호출이 안되며 업데이트 할 때만 호출된다.
            print("firstName is changed from \(oldValue) to \(firstName)")
        }
    }
    
    var lastName: String
    
    // 지연프로퍼티: 계산이 들어가거나 어떤상황에서 불리지않을 경우에 사용해서 시스템에 부담이 가지 않도록
    lazy var isPopular: Bool = {
        print("---> Checking...")
        if fullName == "Freddie Mercury" {
            return true
        } else {
            return false
        }
    }()
    
    // 연산프로퍼티: 실제값을 저장하진 않지만 어떤 계산된값을 리턴하거나 이미있는 저장 프로퍼티를 가공해서 제공할때 사용
    // 본인은 값 저장이안되지만 set 을 이용해서 newValue를 원래사용하던 저장프로퍼티에 셋팅이 가능
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            // components(separatedBy: " ").first -> " "의 앞부분을 firstName에넣어라.
            }
            if let lastName = newValue.components(separatedBy: " ").last {
            self.lastName = lastName
            }
        }
    }
    
    // 타입프로퍼티: 특정 인스턴스에 종속되지 않고 펄슨이라는 타입에 규속
    static var isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")
person.fullName
person.fullName = "Jimin Pak"
person.firstName
person.lastName

Person.isAlien


class MyClass {
    
    // 저장 프로퍼티
    var value1 = 0
    
    // 지연 저장 : 호출했을 때 초기화
    lazy var value2 = value1 + 10
    
    // 연산
    var value3: Int {
        // 읽기
        get {
            let myValue = 50
            return value1 + myValue
        }
        // 쓰기
        set {
            let myValue = newValue + 10
            value1 = myValue + 20
        }
    }
    
    // 프로퍼티 옵저버
    var label = UILabel()
    var text = "" {
        willSet {
            label.text = newValue
        }
        didSet {
            label.text = text
        }
    }
    var value4: Int = 100 {
        willSet {
            print("Value4가 \(value4)에서 \(newValue)으로 바뀔 것이다.")
        }
        didSet {
            print("Value4가 \(oldValue)에서 \(value4)으로 바뀌었다.")
        }
    }
    
    // 타입
    static var value5: Int = 15
}
let myclass = MyClass()
myclass.value1          // 읽기 get
myclass.value1 = 10     // 쓰기 set
print(myclass.value1)
myclass.value2
myclass.value1 = 20
myclass.value2
myclass.value3 = 30
myclass.value1
myclass.value2
myclass.value3
myclass.value4 = 200
myclass.text
myclass.label.text
myclass.text = "집가고싶다"
myclass.text
myclass.label.text
MyClass.value5 = 25
MyClass.value5
