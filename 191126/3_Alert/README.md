## 191126 Alert

* 카운트 추가 창

![](https://user-images.githubusercontent.com/57210827/69687920-e1441480-1107-11ea-8b3a-0268bc8a980c.png)



```swift
import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var countLabel: UILabel!
  // 보여질 outlet uilabet만듬

    override func viewDidLoad() {
            super.viewDidLoad()
    }

    @IBAction private func addCountButton(_ sender: Any) {
        let alertController = UIAlertController (
          title: "카운트 추가 ?" ,message: nil, preferredStyle: .alert
        )
      // uialertcontroller 상수선언
        alertController.addTextField {
          $0.placeholder = "정수 값을 입력하세요."
        }   
      // 상수에 텍스트필드값 설정
      
	 //컨트롤러안의 텍스트필드에 숫자입력수 add count누르면 그숫자만큼 라벨에 추가,감소
        let addCountButton = UIAlertAction (
          title: "Add Count", style: .default) {
          _ in var addValue = 1
           if let textField = alertController.textFields?.first,
              let inputValue = textField.text,
              let number = Int(inputValue) {
                  addValue = number
             }
                self.count += addValue
                self.countLabel.text = String(self.count)
                //print("Add count \(addvalue)")
                }
            alertController.addAction(addCountButton)

        let resetButton = UIAlertAction(
          title: "Reset", style: .destructive) {
          _ in self.count = 0
          self.countLabel.text = "0"
        }
        alertController.addAction(resetButton)

        let cencelButton = UIAlertAction ( 
         title: "Cencel", style: .cancel) 
      	//{ (action) in print("OK버튼") }
        alertController.addAction(cencelButton)

        present(alertController, animated: true)

    }
}
```

