# 191212 AutoLayout

![Autolayout](https://tva1.sinaimg.cn/large/006tNbRwgy1g9u48jlhjhj31ez0pigwx.jpg)

## 1. ViewController

* 프레임을 이용한 위치잡기

## 2. AnchorsViewController

* Anchor 을 이용한 위치잡기

```swift
class AnchorsViewController: UIViewController {

  let cyanView = UIView()
  let lightGrayView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    cyanView.backgroundColor = .cyan
    lightGrayView.backgroundColor = .lightGray
    view.addSubview(cyanView)
    view.addSubview(lightGrayView)

    activateLayoutAnchors() // 두개의 뷰가 나란히
    heightLayoutAnchor() // 두개의 뷰가 상하로
  }
    

  private func activateLayoutAnchors() {
       
    //cyanView's Anchors
    cyanView.translatesAutoresizingMaskIntoConstraints = false
    cyanView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    // cyanView의 topAnchor의 제약(뷰의 safeAreaLayout에 탑에서부터 20)
    cyanView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20).isActive = true 		// leadingAnchor 왼쪽
    cyanView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20).isActive = true
    cyanView.trailingAnchor.constraint(equalTo: lightGrayView.leadingAnchor, constant: -10).isActive = true 		// trailingAnchor 오른쪽
    cyanView.widthAnchor.constraint(equalTo: lightGrayView.widthAnchor).isActive = true
// cyanView의 가로를 제약을 걸겠다(lightGrayView의 가로와 같게)

    
    // lightGrayView's Anchors 
    lightGrayView.translatesAutoresizingMaskIntoConstraints = false
    lightGrayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      /// lightGrayView.leadingAnchor.constraint(equalTo: cyanView.leadingAnchor, constant: 10).isActive = true	 lightGrayView의 왼쪽은 cyanView로 연결되기때문에 굳이 해줄필요가 없다.
    lightGrayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20).isActive = true
    lightGrayView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20).isActive = true
        
    }
    
  private func heightLayoutAnchor() {
    
    cyanView.translatesAutoresizingMaskIntoConstraints = false
    cyanView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    cyanView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    cyanView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    cyanView.bottomAnchor.constraint(equalTo: lightGrayView.topAnchor, constant: -10).isActive = true
    cyanView.heightAnchor.constraint(equalTo: lightGrayView.heightAnchor).isActive = true

    
    lightGrayView.translatesAutoresizingMaskIntoConstraints = false
    /// lightGrayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    lightGrayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    lightGrayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    lightGrayView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }
}
```

## 3. AutoLayoutByCodeViewController

* setupAutoresizingMask(): autoresizingMask를사용해서 위치설정
* activateLayoutAnchors(): isActive를 통한 제약조건 활성화

```swift
class AutoLayoutByCodeViewController: UIViewController {

	private let firstView = UIView()
  private let secondView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstView.backgroundColor = .systemPink
    view.addSubview(firstView)
    secondView.backgroundColor = .systemPurple
    firstView.addSubview(secondView)
    
    setupAutoresizingMask()
    activateLayoutAnchors()
    
    // NSLayoutConstraint, VisualFormat 참고용
//    activateNSLayoutConstraintConstraints()
//    activateVisualFormat()
  }
  
  private func setupAutoresizingMask() {
    // flexibleWidth
    // flexibleHeight
    // flexibleTopMargin
    // flexibleLeftMargin
    // flexibleRightMargin
    // flexibleBottomMargin
    // 6가지 제공
    
    firstView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    // 가로, 세로를 flexible하겠다(변경하겠다.)
    secondView.autoresizingMask = [.flexibleWidth] //, .flexibleHeight]
    // 가로만 flexible하겠다(세로는 고정)
    
    firstView.frame = CGRect(
      x: 50, y: 100,
      width: 150, height: 200
    )
    secondView.frame = CGRect(
      x: 50, y: 50,
      width: 80, height: 80
    )
    
    // autoresizingMask -> 수퍼뷰의 크기가 변했을 때 서브뷰의 변화 확인
//    firstView.frame.size.width = 250
//    firstView.frame.size.height = 400
  }
  

  private func activateLayoutAnchors() {
    /***************************************************
     iOS 9.0 이상에서 사용 가능
     
     view.topAnchor - 뷰에 설정 시
     view.safeAreaLayoutGuide.topAnchor - SafeArea에 설정 시
     ***************************************************/
    
    
    // isActive를 통한 제약조건 활성화
    firstView.translatesAutoresizingMaskIntoConstraints = false
    /// 코드로작성시 translatesAutoresizingMaskIntoConstraints->비활성화해놔야함
    /// AutoresizingMask 자동으로 활성화되는데 이걸 비활성화해야 아래의 명령들이 제대로 먹힘
    /// firstview's topanchor is constrainted equal to view's topanchor, constant is 50, Active
    firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    

    // activate를 통한 제약조건 활성화
    // isActive를 쉽게하기위해
    secondView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 40),
      secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 40),
      secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -40),
      secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -40),
    ])
  }
}

// MARK: - NSLayoutConstraint, VisualFormat

extension AutoLayoutByCodeViewController {
  private func activateNSLayoutConstraintConstraints() {
    firstView.translatesAutoresizingMaskIntoConstraints  = false
    secondView.translatesAutoresizingMaskIntoConstraints  = false
    
    // FirstView <-> View
    NSLayoutConstraint(
      item: firstView,
      attribute: .top,
      relatedBy: .equal,
      toItem: view,
      attribute: .top,
      multiplier: 1,
      constant: 50
      ).isActive = true
    
    NSLayoutConstraint(item: firstView, attribute: .leading,
                       relatedBy: .equal,
                       toItem: view, attribute: .leading,
                       multiplier: 1, constant: 50).isActive = true
    
    NSLayoutConstraint(item: firstView, attribute: .bottom,
                       relatedBy: .equal,
                       toItem: view, attribute: .bottom,
                       multiplier: 1, constant: -50).isActive = true
    
    NSLayoutConstraint(item: firstView, attribute: .trailing,
                       relatedBy: .equal,
                       toItem: view, attribute: .trailing,
                       multiplier: 1, constant: -50).isActive = true
    
    // SecondView <-> FirstView
    NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: firstView, attribute: .top, multiplier: 1, constant: 40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: firstView, attribute: .leading, multiplier: 1, constant: 40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .bottom, relatedBy: .equal, toItem: firstView, attribute: .bottom, multiplier: 1, constant: -40).isActive = true
    NSLayoutConstraint(item: secondView, attribute: .trailing, relatedBy: .equal, toItem: firstView, attribute: .trailing, multiplier: 1, constant: -40).isActive = true
  }
  
  
  
  private func activateVisualFormat() {
    /***************************************************
     Visual Format Syntax
     https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html
     ***************************************************/
    
    firstView.translatesAutoresizingMaskIntoConstraints = false
    secondView.translatesAutoresizingMaskIntoConstraints = false
    
    let views: [String: Any] = ["firstView": firstView, "secondView": secondView]
    let metrics: [String: Any] = ["margin": 50, "padding": 40]
    let visualFormats: [String] = [
      "H:|-margin-[firstView]-margin-|",
      "V:|-margin-[firstView]-margin-|",
      "H:|-padding-[secondView]-padding-|",
      "V:|-padding-[secondView]-padding-|",
    ]
    // Superview와 제약 조건 설정
    
    var allConstraints: [NSLayoutConstraint] = []
    for visualFormat in visualFormats {
      allConstraints += NSLayoutConstraint.constraints(
        withVisualFormat: visualFormat,
        metrics: metrics,
        views: views
      )
    }
    NSLayoutConstraint.activate(allConstraints)
  }
}
```