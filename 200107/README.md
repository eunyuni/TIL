# 200107(GestureRecognizer)

## TouchViewController

![200107Gesture](/Users/eunyuni/Desktop/200107Gesture.png)

```swift
final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  var isHoldingImage = false
  var lastTouchPoint = CGPoint.zero
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
//	이미지뷰의 크기를 맞게 잘라줌 = masksToBounds
    imageView.layer.masksToBounds = true
//  imageView.clipsToBounds = true    
  }
  
  // 터치
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    
    // 고양이 사진을 터치했을때만 변경이 가능하도록
    if imageView.frame.contains(touchPoint) {
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
      lastTouchPoint = touchPoint
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    // isHoldingImage -> true일때만 무브를하도록
    guard isHoldingImage, let touch = touches.first else { return }
    
    // 방법1. 자연스러운 movemove~!!
//    let touchPoint = touch.location(in: touch.view)
//    imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
//    imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
//    imageView.center = touchPoint
  
    // 원하는 위치로 이동하고 싶음(걍이동만 가능)
    // contains->안의 값을 bool로 반환
    // if imageView.frame.contains(touchPoint) {
    // imageView.center = touchPoint
    // }
    
    // 방법2. 이전에 터치한 위치정보를 가지고와서 실행해도 자연스러운무브무브
    let touchPoint = touch.location(in: touch.view)
    let prevTouchPoint = touch.preciseLocation(in: touch.view)
    imageView.center.x = imageView.center.x + (touchPoint.x - prevTouchPoint.x)
    imageView.center.y = imageView.center.y + (touchPoint.y - prevTouchPoint.y)
    imageView.center = touchPoint
  }
  
  // 터치를 종료한 시점
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    imageView.image = UIImage(named: "cat1")
    isHoldingImage = false
  }
  
  // 취소가 됐을경우도 해줘야 안전함
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    imageView.image = UIImage(named: "cat1")
  }
}

```



## GestureViewController

![200107Gesture2](https://tva1.sinaimg.cn/large/006tNbRwgy1gao33zbzncj316v0u0b29.jpg)

```swift
final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  var toggle = true
  var isQuadruple = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
  }
  
  // TapGesture - Discrete
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
    print("Tap!!")
    
    // 1. 두번클릭시 두배로커지도록(bounds)
//    imageView.bounds.size.width *= 2
//    imageView.bounds.size.height *= 2
//    imageView.layer.cornerRadius = imageView.frame.width / 2
//    imageView.layer.masksToBounds = true
    
    // 2. 두번클릭시 두배로커지도록(frame)
//    imageView.frame.size.height *= 2
//    imageView.frame.size.width *= 2
//    imageView.layer.cornerRadius = imageView.frame.width / 2
//    imageView.layer.masksToBounds = true
    
    // 3. 두번클릭하면 커지고, 다시 두번클릭하면 작아지고~
    if toggle {
    imageView.transform.a *= 2
    imageView.transform.d *= 2
      toggle.toggle()
    } else {
      imageView.transform.a /= 2
      imageView.transform.d /= 2
        toggle.toggle()
    }
    
//    guard sender.state == .ended else { return }
//    if !isQuadruple {
//      // 확대
//      imageView.transform = imageView.transform.scaledBy(x: 3, y: 2)
//      // 회전
//      imageView.transform = imageView.transform.rotated(by: 2)
//      // 위치이동
//      imageView.transform = imageView.transform.translatedBy(x: 0, y: 100)
//    } else {
//      imageView.transform = CGAffineTransform.identity
//    }
//    isQuadruple.toggle()
  }
  
  // 마우스로 돌리면 회전하는 기능
  @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
    imageView.transform = imageView.transform.rotated(by: sender.rotation)
    sender.rotation = 0
  }
  
//  Swipe Gesture Recognizer
  @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    // 두가지의 경우의 수만 해당
    if sender.direction == .left {
      imageView.image = UIImage(named: "cat2")
      sender.direction = .right
    } else {
      imageView.image = UIImage(named: "cat1")
      sender.direction = .left
    }
  }
  
  var initialCenter = CGPoint.zero // = CGPoint()
  @IBAction private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
    guard let dragView = sender.view else { return }
    let translation = sender.translation(in: dragView.superview)
    
		// dragView.isUserInteractionEnabled = true // code로 할경우
    // 이미지뷰는 설정이안되어 있기 때문에 스토리보드에서 설정하거나 코드로 설정해줘야함
    
    if sender.state == .began {
      initialCenter = dragView.center
    }
    if sender.state != .cancelled {
      dragView.center = CGPoint(x: initialCenter.x + translation.x,
                                y: initialCenter.y + translation.y)
    } else {
      dragView.center = initialCenter
    }
  }
  
  //Long Press Gesture Recognizer
  @IBAction private func longPressGesture(_ sender: Any) {
    vibrate()
  }
  
  // 누르면 진동효과
  private func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
}

```

