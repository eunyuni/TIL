## 191125 과제


### ViewController 데이터 전달
> AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
> A와 B를 화면 전환할 때마다 각 Label에 전환 횟수 1씩 증가
>  e.g. A에서 B로 갈 때 1, B에서 다시 A로 넘어올 때 2, 다시 A에서 B로 가면 3

```swift
import UIKit

var count = 0
// Label에 숫자를 증가시키기 위해 바깥에 변수를만듬
// class 밖에 만든 변수는 뷰컨트롤러 전체에 사용이가능.

class ViewController: UIViewController {

    override func viewDidLoad() {
     // viewDidLoad (뷰가 로드됨) -> 초기화작업
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        mainLabel()
        appleButton()
      // 보여지는 이곳에 바탕색을 결정, 함수 2개 호출 
        
    }
    
    let label = UILabel()
    let button = UIButton()
  
  // 버튼, 라벨을 상수 선언

    func mainLabel() {
        super.viewDidLoad()
         label.frame = CGRect(x: 120, y: 200, width: 200, height: 200)
         label.text = "0"
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .systemPink
        view.addSubview(label)
        // 라벨 함수
      	// 싸이즈, 텍스트, 폰트, 컬러, view.addsubview
      
    }
    
    func appleButton() {
        super.viewDidLoad()

        button.frame = CGRect(x: 80, y: 450, width: 200, height: 300)
        button.center = view.center
        button.setTitle("넘어갈거임", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(tpaButton(_:)), for: .touchUpInside)
        view.addSubview(button)
      // 버튼 함수
      // 싸이즈, 텍스트, 폰트, 컬러, view.addsubview
      // 버튼의 타겟지정->tpaButton, 애니메이션효과추가
        
    }
    
    @objc private func tpaButton(_ a: UIButton) {
        let nextV = AViewController()
        nextV.modalPresentationStyle = .fullScreen
        nextV.view.backgroundColor = .systemPink
        present(nextV, animated: true) //  이동
        view.addSubview(label)
      // 버튼 액션 함수
      // 액션클릭시 AViewController로 이동
      // present로 이동
        
    }

    override func viewWillAppear(_ animated: Bool) {
       // viewWillAppear (뷰가 나타날것) -> 다른뷰를 왔다 갔다할때 호출
        super.viewWillAppear(animated)
        count += 1
        label.text = String(count)
      // viewDidLoad바깥인 viewWillAppear에다가 count체크
    }
    
}

```



![](https://user-images.githubusercontent.com/57210827/69538129-f19fa680-0fc4-11ea-9cef-0d0d52d7ea29.png)



```swift
import UIKit

class AViewController: UIViewController {
  //이동뷰 class 생성

    override func viewDidLoad() {
      // viewDidLoad (뷰가 로드됨) -> 초기화작업
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        mainLabel()
        appleButton()
        
        count += 1
        label.text = String(count)
     // 초기화하면서 카운트추가
        
    }
    let label = UILabel()
    let button = UIButton()
    
    func mainLabel() {
        super.viewDidLoad()
         label.frame = CGRect(x: 120, y: 200, width: 200, height: 200)
         label.text = "0"
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .systemGray2
        view.addSubview(label)
        // 라벨 함수
    }
    
    func appleButton() {
        super.viewDidLoad()

        button.frame = CGRect(x: 80, y: 450, width: 200, height: 300)
        button.center = view.center
        button.setTitle("돌아갈거임", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        view.addSubview(button)
      // 버튼 함수
      // 타켓 -> buttonAction, 애니메이션효과
    }
        
    @objc private func buttonAction(_ a: UIButton) {
            let nextA = ViewController()
            nextA.view.backgroundColor = .systemGray6
            dismiss(animated: true)//이전으로 돌아감
      // 버튼액션 함수
      
        }
    }
```



![](https://user-images.githubusercontent.com/57210827/69538150-ffedc280-0fc4-11ea-8e96-6259b5a6c523.png)
