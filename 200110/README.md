# 200110 UIScrollView

* 최소배율
* 2배확대
* 컨텐츠이동

![200110UIScrollView](https://tva1.sinaimg.cn/large/006tNbRwgy1gau4c7z21jj30u010jwtc.jpg)



```swift
import UIKit

final class ViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var imageView: UIImageView!
  
  private var zoomScale: CGFloat = 1.0 {
    didSet {
      print("current Zoom Scale:", String(format: "%.2f", zoomScale))
    }
  }
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    scrollView.bounces = true
    
    // 화면에 가득차도 스크롤이 가능하도록 설정하는부분
    scrollView.alwaysBounceVertical = true
    scrollView.alwaysBounceHorizontal = true
    
    updateScrollViewZoomScale()
    
  }
  
  // 스크롤뷰의 맥시멈과 미니멈 설정
  private func updateScrollViewZoomScale() {
    let widthScale = view.frame.width / imageView.bounds.width
    let heightScale = view.frame.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = 1
    // maximum을 3으로 설정해서 2배확대를 하더라도 최대 3까지만 가능
    scrollView.maximumZoomScale = 3
    
    printInfo()
  }
  
  // MARK: - Action Handler
  @IBAction private func fitToWidth(_ sender: Any) {
    print("\n---------- [ fitToWidth ] ----------")
    zoomScale = scrollView.frame.width / imageView.bounds.width
    scrollView.setZoomScale(zoomScale, animated: true)
    print(scrollView.frame.width)
    print(imageView.bounds.width)
    print(zoomScale)
    
    printInfo()
  }
  
  @IBAction private func scaleDouble(_ sender: Any) {
    print("\n---------- [ scaleDouble ] ----------")
    scrollView.setZoomScale(zoomScale * 2, animated: true)
    print(zoomScale)
    zoomScale = scrollView.zoomScale
    print(zoomScale)
    
    printInfo()
    //특정 위치를 zoom x: 100 y:100 의 위치를 보여줘라!
//    let rectToVisible = CGRect(x: 100, y: 100, width: 200, height: 300)
//    scrollView.zoom(to: rectToVisible, animated: true)
  }

  @IBAction private func moveContentToLeft(_ sender: Any) {
    print("\n---------- [ moveContentToLeft ] ----------")
    //내가직접 스크롤하지않아도 누르면 해당좌표만큼 움직이도록
    let newOffSet = CGPoint(x: scrollView.contentOffset.x + 150,
                            y: scrollView.contentOffset.y)
    scrollView.setContentOffset(newOffSet, animated: true)
    
    printInfo()
  }
  
  @IBAction private func moveTapButton(_ sender: Any) {
//    let second2 = SecondViewController().storyboard
//    present(second2, animated: true)
  }
  
  func printInfo() {
    print("\n---------- [ ScrollView Info ] ----------")
    print("frame: ", scrollView.frame)
    print("contentSize: ", scrollView.contentSize)
    print("bounds: ", scrollView.bounds)
    print("ContentOffset: ", scrollView.contentOffset)
  }
}

// MARK: -UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
  
  //어떤걸 줌으로 사용할지 델리를 통해설정
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    imageView
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    printInfo()
  }
}
```

