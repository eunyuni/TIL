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

```swift

import UIKit

var str = "Hello, playground"

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let exterHours = hours - 40
    salary += exterHours * payPerHour * 2
    hours -= exterHours
}

salary += hours * payPerHour

var isjason = true

var title = ""

//if isjason {
//    title = "JASON CEO"
//} else {
//    title = "Other CEO"
//}

isjason ? "JASON CEO" : "Other CEO"

print("---while---")
var i = 10
while i < 10 {
    print(i)
    i += 1
}
// 조건 > 코드수행 > 조건 > 코드수행

print("---repeat---")
i = 10
repeat {
    print("----->", i)
    i += 1
} while i < 10
// 코드수행 > 조건 > 코드수행 > 조건


let closedRange = 1...10
let helfOpenRange = 0..<10

var sum = 0

for i in closedRange {
   // print("---> \(i)")
    sum += i
}
print("total sum = \(sum)")

//for i in closedRange {
//    if i % 2 == 0 {
//        print("---> \(i)")
//    }
//}

for i in closedRange where i % 2 == 0 {
    print("---> \(i)")
}

for i in closedRange {
    
    if i == 5 {
        continue
    }
    print("----> \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("\(i) * \(j) = \(i * j)")
    }
}

let pet = "dog"

switch pet {
case "doe", "cat":
    print("난 개나 새다.")
default:
    print("몰라")
}

let num = 5
switch num {
case _ where num % 2 == 0:
    print("짝")
default:
    print("홀")
}

let codinate = (x: 0, y: 4)

switch codinate {
case (0, 0):
    print("---> 기준점")
case (_, 0):
    print("---> 점이 x 축에있음")
case (0, _):
    print("---> 점이 y 축에있음")
default:
    print("---> 어딘가 있음")
}

let codinate1 = (x: 4, y: 4)

switch codinate1 {
case (0, 0):
    print("---> 기준점")
case (let x, 0):
    print("---> 점이 x 축에있음 x: \(x)")
case (0, let y):
    print("---> 점이 y 축에있음 y: \(y)")
case (let x, let y) where x == y:
    print("---> x는 y와 같다. x:\(x), y:\(y)")
case (let x, let y):
    print("---> 점이 y 축에있음 x:\(x), y:\(y)")
}

```
