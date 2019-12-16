## 191216 Autolayout

## 1. DynamicAutolayoutExample

```swift
class ViewController: UIViewController {

  @IBOutlet private weak var myView: UIView!
  @IBOutlet var centerXConstraint: NSLayoutConstraint!

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    // 1. constant, multiplier 변경
    // centerXConstraint.constant = -100
    
    // 2. 우선순위 변경
    // centerXConstraint.priority = .defaultHigh // 750으로 변경해주면서 우선순위를 바꿈
    // centerXConstraint.priority = .required // 1000
        
    // 3. isActive
    // centerXConstraint.constant = 100
    // centerXConstraint.isActive = false
    // centerXConstraint.constant = 300
    // centerXConstraint.isActive = true

    // print(myView.constraints)
    // print(view.constraints)
    }

  var toggle = false
  @IBAction private func didTapButton(_ sender: Any) {

// view.setNeedsLayout() -> 레이아웃을 다시 잡아야 한다고 시스템에게 알리는 역할
// view.layoutIfNeeded() -> 레이아웃을 다시 잡아야 하는 상황이면 지금 즉시 수행하도록 하는 역활
        
    if toggle {
      UIView.animate(withDuration: 1, animations: {
        self.centerXConstraint.constant = 150 // view.setNeedsLayout()를 호출하는것2과 같음
        self.view.layoutIfNeeded()
      })
      // centerXConstraint.priority = .required
    }else {
      UIView.animate(withDuration: 1, animations: {
        self.centerXConstraint.constant = -150
        self.view.layoutIfNeeded()
      })
      // centerXConstraint.priority = .defaultHigh
    }
    toggle.toggle()
    }
}
```



## 2. **Intrinsic Content Size**

* 고유의 콘텐츠 크기(컨텐츠를 잘라내거나 줄이지 않고도 온전히 표현할 수 있는 최소한의 공간)

### CHCR

* Intrinsic Size 의 값을 기준으로
  * **Content Hugging** 
    * 우선순위에 따라 자기자신의 크기를 딱맞도록 해주는개념
    * 줄어드는것과 연관이있음
    * 더이상 늘어나지 못하도록 최대 크기에 제한을 둠
  * **Content Compression Resistance** 
    * 나는 내최소한의 크기를 지켜야해! 
    * 크기가 지정되어 있어도 안에 내부의 글자크기가 커지면 그만큼 같이 늘어나고 더 글자가 작아지면  최소한의 크기를 지킴
    * 늘어날때와 관련있음

![CHCR](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yropvzjhj31g60iy4qp.jpg)

### Priority

* 각각의 제약조건은 1~1000사이의 우선순위를 가짐
* Required(1000), High(750), Low(250)
* 상충되는 제약조건이 적용되어 있다면 우선순위가 높은 것으로 적용

![constant](https://tva1.sinaimg.cn/large/006tNbRwgy1g9yrw2g37nj310f0kzjza.jpg)