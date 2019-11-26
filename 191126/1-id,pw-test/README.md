## 191126 과제


### text field 기능


```swift
import UIKit

class ViewController: UIViewController {

@IBOutlet weak var idTextField: UITextField!
  // 아울렛 텍스트필드-> UItext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        idTextField.font = UIFont.systemFont(ofSize: 30)
        idTextField.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        idTextField.font = UIFont.boldSystemFont(ofSize: 30)
        idTextField.font = UIFont.preferredFont(forTextStyle: .caption1)
//        idTextField.borderStyle = .none
        idTextField.textAlignment = .center
        idTextField.keyboardType = .URL
        // 슬래시랑, 닷컴생김 키보드타입!
      
      // viewDidLoad -> 뷰가보여짐!
      // 텍스트필드의 폰트, 싸이즈, 키보드타입, 위치설정  
         

    }
  
  //이벤트를 발생시킨객체에대한 정보를 샌더를 통해 전달
    @IBAction func textFieldDidBegin(_ sender: UITextField) {
        print("키보드 띄우고")
      // 하단 태그설명 참고
        if sender.tag == 0 {
            print("idTextField")
        } else if sender.tag == 1 {
            print("passwordTextFiedl")
        } else {
            print("confirmPassword")
        }      // 키보드띄우고
    }
// (_ sender: Any) -> sender한테 어떤 메소드나 타입을 설정하려고해도 모름. 타입캐스팅을 통해 변환을 시도해보고 맞으면 사용 / 타입을 any말고 사용할 타입으로 지정해서 사용
  
// 타입캐스팅 사용시, 어떤타입인지 확인후에 맞으면 if문으로
//    if let tf = sender as? UITextField {
//    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text ?? "")

        // 해당 textField에서 사용자가 6자 이상입력시 키보드가 내려가도록 설정
        if sender.text!.count > 6 {
            sender.resignFirstResponder()
        }
      
// 키보드 내려가는 설정의 또다른 방법      
//        view.endEditing(true)
// 다루고있는 텍스트필드가뭔지모르는데 그냥내리고싶을때 뷰에있는 모든 애들한테 키보드 내리도록 명령/입력하자마자 내려감
      
    }
    
    @IBAction func textFieldDidEnd(_ sender: Any) {
        print("textFieldEditingDidEnd")
    }

    
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        print("텍스트필드 종료하고")
    }
    //텍스트필드를 종료.
    
    @IBAction func textFieldPassword(_ sender: Any) {
        print("패스워드Begin")
    }
    // 비번입력
    
    @IBAction func passwordOnExit(_ sender: Any) {
        print("패스워드Exit")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    idTextField.becomeFirstResponder()
        // 바로 키보드 뜨게끔..

}
}

```
![](https://user-images.githubusercontent.com/57210827/69616152-721fdf00-1079-11ea-9201-d5307c9ad248.png)

### Tag 사용
* 텍스트 필드가 여러개일때 매번 메서드를 연결하기 어렵기에 컨드롤해서 함수안으로 끌어갈수있다.
* Tag: 번호를 지정해서 if문으로 쉽게 사용 가능
![](https://user-images.githubusercontent.com/57210827/69616301-ba3f0180-1079-11ea-9d31-26b02f11e748.png)

### 텍스트필드에 즉시 키보드 뜨게할때

[](https://user-images.githubusercontent.com/57210827/69616480-0722d800-107a-11ea-8abd-0ef134360376.png)

### 텍스트필드에서 6글자 이상입력시 키보드 내려가게끔

![](https://user-images.githubusercontent.com/57210827/69616603-3e918480-107a-11ea-8416-ebd468f0d9d0.png)

### 그냥 키보드를 내리고싶을때

![](https://user-images.githubusercontent.com/57210827/69616744-75679a80-107a-11ea-981c-cbc174bcbb0c.png)





