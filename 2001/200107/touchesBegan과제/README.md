## 과제: touchesBegan를 이용해서 횟수, 좌표 구하기

```swift
import UIKit

class ViewController: UIViewController {

  var count = UILabel()
  var coordinate = UILabel()
  var countText = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    count.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    coordinate.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.addSubview(count)
    view.addSubview(coordinate)
    autolayout()
    count.text = "횟수 :"
    coordinate.text = "좌표 :"
    
  }


  private func autolayout() {
    count.translatesAutoresizingMaskIntoConstraints = false
    count.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    count.widthAnchor.constraint(equalToConstant: 100).isActive = true
    count.heightAnchor.constraint(equalToConstant: 30).isActive = true
    count.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    count.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    count.bottomAnchor.constraint(equalTo: coordinate.topAnchor, constant: -20).isActive = true
    count.tintColor = .black
    count.font = .systemFont(ofSize: 25)
    
    
    coordinate.translatesAutoresizingMaskIntoConstraints = false
    coordinate.topAnchor.constraint(equalTo: count.bottomAnchor, constant: 20).isActive = true
    coordinate.widthAnchor.constraint(equalToConstant: 100).isActive = true
    coordinate.heightAnchor.constraint(equalToConstant: 30).isActive = true
    coordinate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    coordinate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
//    coordinate.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -230).isActive = true
    coordinate.tintColor = .black
    coordinate.font = .systemFont(ofSize: 25)

  }
  
  var initialCenter = CGPoint.zero
  var x : CGPoint = CGPoint.zero
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  super.touchesBegan(touches, with: event)
  guard let touch = touches.first else { return }
  let touchPoint = touch.location(in: touch.view)
    
    print("touchPoint: ", touchPoint.x)
    print("initialCenter: ", initialCenter.x)
    
    if touchPoint.x <= initialCenter.x + 10 || touchPoint.y <= initialCenter.y + 10{
    countText += 1
    count.text = "횟수 : \(countText)"
    coordinate.text = "좌표 : \(touchPoint)"
    } else {
      countText = 1
      count.text = "횟수 : \(countText)"
      coordinate.text = "좌표 : \(touchPoint)"
    }
    
  initialCenter = touchPoint
    
  }
}


```
