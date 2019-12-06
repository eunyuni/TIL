## 191206 Singleton,UserDefaults

* 스위치의 ON, OFF에 따라 image와 label이 변경되며 앱종료시 값을 저장(UserDefaults)하여 다시 실행하면 종료했을때의 상태로 만들어줌

![191206CatDog](https://user-images.githubusercontent.com/57210827/70311622-57a5ec80-1855-11ea-8373-2852213e51a7.jpg)



* 강사님 xcode.... 
* 나는 저장값 이용을 못했슴다.........

```swift
import UIKit

class SecondViewController: UIViewController {

  struct Key {
    static let imagePicker = "ImagePickerSwitch"
  }
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var imagePicker: UISwitch!
    
  let userDefaults = UserDefaults.standard
    
override func viewDidLoad() {
    super.viewDidLoad()
    let isOn = userDefaults.bool(forKey: Key.imagePicker)
    imagePicker.setOn(isOn, animated: false)
    configureData(isOn: isOn)
    }
    
    
  @IBAction private func switchChanged(_ sender: UISwitch) {
    print("\n---------- [ 저장 상태 확인 ] ----------\n")
    configureData(isOn: sender.isOn)
    userDefaults.set(sender.isOn, forKey: Key.imagePicker)
    print(userDefaults.bool(forKey: Key.imagePicker))
  }
  func configureData(isOn: Bool) {
    let animal = isOn ? "dog" : "cat"
    let animal2 = isOn ? "강아지" : "고양이"
    imageView.image = UIImage(named: animal)
    titleLabel.text = animal2
  }
}
```

