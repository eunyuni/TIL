## 191206 Singleton,UserDefaults

* **Singleton**

  > 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴

  > 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주

  > 어플리케이션에서 유일하게 하나만 필요한 객체에 사용

  > UIApplication, AppDelegate 등

```swift
class PrivateSingleton {
  static let shared = PrivateSingleton()
  
  // init을 private시켰으므로 쉐어드를 이용해서만 접근이가능. 고로 모두다 공유됨
  private init() {}
  var x = 1
}
```

```swift
/*
 싱글톤 방식으로 해보기 전에
 아래에 주어진 코드를 이용해 User에 친구 추가하기
 유저를 전역변수로 사용하지 말 것
 */

class User {
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

class FriendList1 {
    var user : User
    init(user: User) {
        self.user = user
    }

    func addFriend(name: String) {
        let friend = Friends(name: name)
        user.friends.append(friend)
    // 호출 시 해당 이름의 친구를 friends 배열에 추가
  }

  func blockFriend(name: String) {
    let friend = Friends(name: name)
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    if let index = user.friends.firstIndex(of: friend) {
      user.friends.remove(at: index)
    }
    if !user.blocks.contains(friend) {
      user.blocks.append(friend)
    }
  }
}

let user = User()

var friendList = FriendList(user: user)
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성
//user.friends

friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성



/*
 싱글톤 클래스를 이용한 방법
 */


class User {
  static let shared = User()
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}


class FriendList {
  func addFriend(name: String) {
 
    let user = User.shared  
    let friend = Friends(name: name)
    user.friends.append(friend)
  }
  
  
  func blockFriend(name: String) {
    let friend = Friends(name: name)
    
    if let index = User.shared.friends.firstIndex(of: friend) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(friend) {
      User.shared.blocks.append(friend)
    }
  }
}
```



* **UserDefaults**

  >  iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나

  >  간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장





## Practice !

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



* 싱글톤과제
* 싱글톤방식으로 텍스트필드의 값을 전달, 일반방식으로 전달

![1206과제](https://tva1.sinaimg.cn/large/006tNbRwgy1g9pgkqh328j30u00uuk34.jpg)