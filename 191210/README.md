# 191210 Delegate

* 일부의 기능만 내가 원하는 기능으로 교체해서 사용할 수 있게 커스텀하는 것 
* 런치타임 시스템부분 -> 커스텀뷰

![Delegate](https://tva1.sinaimg.cn/large/006tNbRwgy1g9u687lteij31ao0u0woy.jpg)


```swift
class ViewController: UIViewController {

  @IBOutlet weak var myView: CoustomView!

  override func viewDidLoad() {
    super.viewDidLoad()

    myView.backgroundColor = .red
    myView.backgroundColor = nil

    //2. delegate = self
    myView.delegate = self
    myView.backgroundColor = .red
        
    }
}

// 1. Delegate 프로토콜 채택
extension ViewController: CustomViewDelegate {
    // 이부분은 새롭게 커스텀이 가능
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return .black }
        return color == .red ? .blue : color
    }
}
```



```swift
import UIKit

// 1. 프로토콜 정의
protocol CustomViewDelegate: class{
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

class CoustomView: UIView {
// 2. delegate 프로퍼티 선언
  weak var delegate: CustomViewDelegate?
// (프로토콜에서 클래스를 상속받지 않으면) weak로 만들면 오류발생 / 프로토콜이 클래스 바운드여야한다 weak는 참조와관련되어있는데 참조는 클래스와관련있고 이것을 프로토콜에 클래스라고 한정지어줘야한다.

  override var backgroundColor: UIColor? {
    // override한 프로퍼티는 연산으로 사용해야함 저장이불가
    get { super.backgroundColor }
    set {
            
// 3. delegate 메서드호출
    let color = delegate?.colorForBackground(newValue)
///델리게이트가 누가될진모르지만 델리한테물어봄 이걸 받아서 처리해줄 객체가 있다면 그놈이 받아서 처리해줘(프로토콜을 통해) 컬러포백그라운드 함수를 수행시킬거니까 이걸 수행하면 컬러를 돌려줘라 라는의미..ㅎ
    let newColor = color ?? newValue ?? .gray
    super.backgroundColor = newColor
    print("새로변경될 색은:", backgroundColor!)

//            super.backgroundColor = newValue
//            print("새로 변경될 색은: ", newValue)
            
//            super.backgroundColor = newValue ?? .black
//            if newValue == .red {
//                super.backgroundColor = .blue
//            }
            
//            if newValue == .red {
//                super.backgroundColor = .blue
//                print("새로 변경될 색은: ", newValue)
//            } else if newValue == nil {
//                super.backgroundColor = .black
//                print("새로 변경될 색은: ", newValue)
//            } else {
//                super.backgroundColor = newValue
//                print("새로 변경될 색은: ", newValue)
//            }
            
//            switch newValue {
//            case UIColor.red:
//                super.backgroundColor = .blue
//            case nil:
//                super.backgroundColor = .black
//            default:
//                super.backgroundColor = newValue
//            }
            
        }
    }
    // 나만의 커스텀뷰를 만들어서 사용
    // 커스텀뷰를 상속받으면 항상 프린트함
}
```

