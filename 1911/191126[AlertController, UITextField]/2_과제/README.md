## 191126 과제

![](https://user-images.githubusercontent.com/57210827/69630377-3f351580-1090-11ea-964c-5fdecf09f371.png)

### [ 과제 ]

> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

```swift
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 바탕화면 클릭시 키보드 내려감
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                view.addGestureRecognizer(tap)
        
    }
    @objc func handleTap(_ sender: Any) {
            view.endEditing(true)
        }
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBAction func textField(_ sender: Any) {
        print("DidBegin 상태")
        testLabel.textColor = .systemBlue
        testLabel.font = UIFont.systemFont(ofSize: 40)

    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        print("Change 상태")
        print(sender.text ?? "")
        
        testLabel.text = sender.text
        testLabel.textColor = .systemBlue
        testLabel.font = UIFont.systemFont(ofSize: 40)
        
    }
    
    @IBAction func testDidEnd(_ sender: Any) {
        print("didend")
        testLabel.textColor = .systemRed
        testLabel.font = UIFont.systemFont(ofSize: 20)
    }

              }

```
