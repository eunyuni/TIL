### contentmode (과제)

#### [ 과제 - 앱 구현 ]

1. UISwitch, UISegmentedControl 을 이용한 문제

- **UISwitch** : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구
- **UISegmentedControl** : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현(참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 **valueChanged** 라는 것을 활용)

```swift
    @IBOutlet weak var onoffCheck: UISwitch!
    
    @IBOutlet weak var onOff: UILabel!
    
    @IBOutlet weak var a123: UISegmentedControl!
    
    @IBAction func switchButton(_ sender: Any) {
        if onoffCheck.isOn {
            onOff.text = "ON"
            onOff.textColor = .systemPink
            onOff.textAlignment = .left
        }else{
            onOff.text = "OFF"
            onOff.textColor = .systemBlue
            onOff.textAlignment = .right
        
    }
    }
    
    @IBAction func firstSecondThidr(_ sender: Any) {
        switch a123.selectedSegmentIndex {
        case 0:
            onOff.text = "하나"
            onOff.textAlignment = .center
            onOff.textColor = .systemYellow
        case 1:
            onOff.text = "두울"
            onOff.textAlignment = .center
            onOff.textColor = .gray
        case 2:
            onOff.text = "세엣"
            onOff.textAlignment = .center
            onOff.textColor = .green
        default:
            break
        }
    }
```

![](https://user-images.githubusercontent.com/57210827/69421114-8e630980-0d63-11ea-996d-fc305612421a.png)

### ViewFrame (강사님 구현)

* Test 2를 for문 사용

```swift
final class ViewController: UIViewController {
  
  let colors: [UIColor] = [.blue, .red, .green]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1) 루트뷰에 모두 올리는 방식
    addSubviewOnRootView()
    
    // 2) 배경 뷰 위에 올리는 방식
//    addSubviewOnBackgroundView()
  }
  
  
  func addSubviewOnRootView() {
    var frame = view.frame
    
    for color in colors {
      let colorView = createSubview(frame: frame, color: color)
      view.addSubview(colorView)
      frame = colorView.frame
      print(colorView.frame)
    }
  }
  
  func addSubviewOnBackgroundView() {
    var superView: UIView = view
    
    for color in colors {
      let colorView = createSubview(size: superView.frame.size, color: color)
      superView.addSubview(colorView)
      superView = colorView
      print(colorView.frame)
    }
  }
  
  
  func decreaseRectFrame(from frame: CGRect) -> CGRect {
    CGRect(x: frame.minX + 30,
           y: frame.minY + 30,
           width: frame.width - 60,
           height: frame.height - 60)
  }
  
  func createSubview(frame: CGRect, color: UIColor) -> UIView {
    let view = UIView(frame: decreaseRectFrame(from: frame))
    view.backgroundColor = color
    return view
  }
  
  func createSubview(size: CGSize, color: UIColor) -> UIView {
    createSubview(frame: CGRect(origin: .zero, size: size), color: color)
  }
}
```

![](https://user-images.githubusercontent.com/57210827/69421225-d124e180-0d63-11ea-9e4f-b2a91f254f27.png)

### test 1

* 수업시간 실습

![](https://user-images.githubusercontent.com/57210827/69421253-e6017500-0d63-11ea-90d1-db1d287c8bab.png)



### test 2

* 수업시간 실습

![](https://user-images.githubusercontent.com/57210827/69421283-fa457200-0d63-11ea-8411-383ca6b681b4.png)