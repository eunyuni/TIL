# 200113 UIView Animation

![200113UIViewAnimation](https://tva1.sinaimg.cn/large/006tNbRwgy1gav6vq5l8xj316u0u0122.jpg)



```swift
import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
  // 랜덤사진 Array저장
  let images: [UIImage] = [
    "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    ].compactMap(UIImage.init(named:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.animationImages = images
    
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating()
  }
  
  // 한싸이클을 몇초동안 보여줄것인가
  // 지정하지않았다면: 한장 -> 1/30초로 보여짐
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    imageView.animationDuration = sender.value
    // default 0 - 1/30
  }
  
  // 원하는 횟수만큼 이미지를 반복하도록
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount)"
    imageView.animationRepeatCount = repeatCount
    // Default 0 -> 무한반복
  }
}
```



```swift
import UIKit

final class AnimationViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet private weak var userIdTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  @IBOutlet private weak var loginButton: UIButton!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet private weak var countDownLabel: UILabel!
  @IBOutlet private weak var testView: UIView!
  
  var count = 5 {
    didSet { countDownLabel.text = "\(count)" }
  }
  
  // MARK: - View LifeCycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    activityIndicatorView.isHidden = true
    userIdTextField.center.x = -view.frame.width
    passwordTextField.center.x = -view.frame.width
    loginButton.center.x = -view.frame.width
    
    test()
  }
  
  //withRelativeStartTime: 상대적 스타트 시간 (젤처음시작하는 애니메이션), relativeDuration: 상대적 Duration(withDuration요거의 상대적인 ..)
  // animateKeyframes: withDuration을 바탕으로 상대적인 시작시간, 지속시간을 쪼개서 실행하는..뭐그런거임
  func test() {
    let initialFrame = testView.frame
    UIView.animateKeyframes(
      withDuration: 10,
      delay: 0,
      animations: {
        
        // relativeDuration: 10초 * 0.0 = 2.5초 동안 애니메이션
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
          self.testView.center.x += 50
          self.testView.center.y -= 50
        }
        // withRelativeStartTime: 10초 * 2.5 = 2.5초 뒤에 시작, 2.5초뒤에 2.5초동안 애니메이션, 총 5초
        UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
          self.testView.center.x += 100
          self.testView.center.y += 50
        }
        // withRelativeStartTime: 10초 * 0.5 = 5초 뒤에 시작
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
          self.testView.center.x -= 100
          self.testView.center.y -= 200
        }
        // withRelativeStartTime: 10초 * 0.7 = 7초 뒤에 시작, 10초 * 0.3 = 3 3초동안 실행
        UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
          self.testView.frame = initialFrame
        }
    })
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //    UIView.animate(withDuration: 0.6, delay: 1, animations: {
    //      self.userIdTextField.frame.origin = CGPoint(x: 8, y: 26)
    //    })
    //    UIView.animate(withDuration: 1.8, delay: 1, animations: {
    //      self.passwordTextField.frame.origin = CGPoint(x: 8, y: 65)
    //    })
    //    UIView.animate(withDuration: 2.4, delay: 1, animations: {
    //      self.loginButton.frame.origin = CGPoint(x: 82, y: 116)
    //    })
    
    UIView.animate(withDuration: 0.6) {
      self.userIdTextField.center.x =
        self.userIdTextField.superview!.bounds.midX
    }
    UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
      self.passwordTextField.center.x =
        self.passwordTextField.superview!.bounds.midX
    })
    
    // usingSpringWithDamping: 감쇠조화진동자
    // curveEaseInOut: 기본값(가장자연스러운 애니메이션옵션) []비워두면 자동적용
    // autoreverse반대에서 다시 애니메이션다시시작
    // repeat애니메이션반복
    // .autoreverse, .repeat -> 무한반복
    UIView.animate(
      withDuration: 0.6,
      delay: 1,
      usingSpringWithDamping: 0.6,
      initialSpringVelocity: 0,
      options: [.curveEaseInOut],
      animations: {
        self.loginButton.center.x =
          self.loginButton.superview!.bounds.midX
    }, completion: {
      print("isFinished :", $0)
    })
  }
  
  // MARK: - Action Handler
  @IBAction private func didEndOnExit(_ sender: Any) {}
  @IBAction private func login(_ sender: Any) {
    view.endEditing(true) // 로그인눌렀을때 키보드가 내려가도록
    guard countDownLabel.isHidden else { return } // 레이블이 숨겨져있을때만 동작하게 하기위한
    loginButtonAnimation()
    countDown()
  }
  
  func loginButtonAnimation() {
    activityIndicatorView.isHidden = false
    activityIndicatorView.startAnimating()
    let centerOrigin = loginButton.center
    UIView.animateKeyframes(
      withDuration: 1.6,
      delay: 0,
      animations: {
        
        // 로그인 버튼을 0.4초동안 우측 아래로 이동
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/4) {
          self.loginButton.center.x += 50
          self.loginButton.center.y += 20
        }
        // 버튼이 45도 회전하여 우측 상단으로 이동하며 흐려지다가 사라짐
        UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
          self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
          self.loginButton.center.x += 150
          self.loginButton.center.y -= 70
          self.loginButton.alpha = 0.0
        }
        // 처음에 있던 위치의 아래에 위치하도록 함 (안보이는 상태)
        UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.1) {
          self.loginButton.transform = .identity
          self.loginButton.center = CGPoint(
            x: centerOrigin.x,
            y: self.loginButton.superview!.frame.height + 120 // superview->회색네모뷰
          )
        }
        // 처음의 위치로 돌아오면서 다시 나타남
        UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
          self.loginButton.alpha = 1.0
          self.loginButton.center = centerOrigin
        }
    }) { _ in
//      self.activityIndicatorView.stopAnimating()
//      self.activityIndicatorView.isHidden = true
    }
  }
  
  func countDown() {
    countDownLabel.isHidden = false
    
    // .transitionFlipFrom 도 다양한 옵션효과를 줄수있따~
    UIView.transition(
      with: countDownLabel,
      duration: 0.5,
      options: [.transitionCrossDissolve],
      animations: { self.count -= 1 }
    ) { _ in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        guard self.count == 0 else { return self.countDown() }
        self.count = 5
        self.countDownLabel.isHidden = true
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.isHidden = true
      }
    }
  }
}
```

