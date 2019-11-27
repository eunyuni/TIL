## 191126  과제 복습

![](https://user-images.githubusercontent.com/57210827/69686422-15690680-1103-11ea-9881-1848260b8da0.png)

```swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "ㅎㅎㅎㅎㅎㅎ"
      // 텍스트라벨의 텍스트 = ㅎㅎㅎㅎㅎㅎ       
    }

    @IBOutlet weak var textLabel: UILabel!
  // UI라벨만듬
    
    @IBAction func textdsfaweBegin(_ sender: UITextField) {
        print("textBegin")
        print(sender.tag)
        if sender.tag == 0 {
            textLabel.textColor = .systemPink
            textLabel.font = UIFont.systemFont(ofSize: 40)
        } else if sender.tag == 2 {
            textLabel.textColor = .systemGray
            textLabel.font = UIFont.systemFont(ofSize: 40)
        }
      // UI Action Begin함수 만듬
      // 태그사용해서 0, 2번 textfield에 beging효과 적용
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        print(sender.text ?? "")
        textLabel.text = sender.text
      // change 액션함수 만들어서 textlabel에 입력하는 내용을 복붙시킴

    }
    
    @IBAction func textDidEndOnExit(_ sender: Any) {
        print("textDidEndOnExit")
    }
    
    @IBAction func textDidEnd(_ sender: Any) {
        print("textDidEnd")
        textLabel.textColor = .systemGreen
        textLabel.font = UIFont.systemFont(ofSize: 20)
      // DidEnd함수안에 컬러,폰트적용 (키보드내리면 싸이즈 20)
    }
    
    @IBAction func text2Begin(_ sender: Any) {
        textLabel.textColor = .systemGray
        textLabel.font = UIFont.systemFont(ofSize: 40)
      // tag2번 textfield의 begin효과
        
    }
    
    @IBAction func text2Changed(_ sender: UITextField) {
        textLabel.text = sender.text
      // tag2번 textlabel text에 입력내용 복붙
    }
    
    @IBAction func text2DidEnd(_ sender: UITextField) {
        textLabel.textColor = .systemPurple
    }
      
}


```

