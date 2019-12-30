# 191230



1. UIAlertController 버튼
2. UIImage
3. Action Button
4. Random Number
5. Autolayout



![wanted](/Users/eunyuni/Desktop/wanted.png)

```swift
import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var testLable: UILabel!
  @IBOutlet private weak var imageView: UIImageView!

  var 현상금 = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = UIImage(named: "sangdi")

    refresh()
  }

  @IBAction func alertButton() {
    let message = "현상금은 \(현상금)원 이지롱"
    let alert = UIAlertController(title: "현상금~!!!!! 👀", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "okkkk", style: .default, handler: { okAction in
                                                                            self.refresh()
                                                                           })
    alert.addAction(okAction)
    present(alert, animated: true)
  }

  func refresh() {
    let randomNum = arc4random_uniform(100000) + 1
    현상금 = Int(randomNum)
    testLable.text = "₩ \(현상금)"
  }
}
```

