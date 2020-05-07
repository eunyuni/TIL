# 과제: UIScrollView 에 UIPageControl을 사용하여 현재 페이지를 표시하는 화면 만들기

![200110과제](https://tva1.sinaimg.cn/large/006tNbRwgy1gau4ntq3xbj31c60u01kx.jpg)

```swift
/****************************
 
 [ 과제 ]
 1.  UIScrollView 에 UIPageControl을 사용하여 현재 페이지를 표시하는 화면 만들기 (별도 이미지 참고)
 힌트
 - UIScrollView: Delegate 이용(scroll 관련),  pagingEnabled 속성 참고
 - UIPageControl: currentPage 속성 및 numberOfPages 속성 참고
 
 ****************************/
import UIKit

class SecondViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var pageControl: UIPageControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    scrollView.delegate = self
    setPageControl()
  }
  private func setPageControl() {
    scrollView.isPagingEnabled = true
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 4, height: UIScreen.main.bounds.height)
    scrollView.alwaysBounceVertical = false
    // pageControl.numberOfPages = 5
    // pageControl.currentPage = 0
    pageControl.isUserInteractionEnabled = false
  }
}

// MARK: -UIScrollViewDelegate
extension SecondViewController: UIScrollViewDelegate {
  
  // 스크롤이동시 움직일떄마다 호출
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
  }
  
// 스크롤뷰에서 손을 땟을 때 호출
//  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//    <#code#>
//  }
//
//  // 스크롤뷰 드래그가 끝나고 멈췄을 때 호출
//  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//    <#code#>
//  }
}
```

