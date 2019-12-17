# UITableView

## Plain Table Views

* 기본 스타일
* 하나 이상의 섹션을 가질 수 있으며  각 섹션은 다시 하나 이상의 로우(행)를 가짐
* 각 섹션은 그 자신의 헤더/푸터 뷰를 가질 수 있고 해당 섹션이 보여질 때   헤더뷰는 Top, 푸터뷰는 Bottom 에 고정
* 섹션을 빠르게 검색할 수 있도록   Indexed List 를 설정 가능

## Grouped Table Views

* 관련된 아이템들을 하나의 그룹으로 그룹핑 
* 데이터 계층 구조에 대한 상세 정보를 표현 하는 데 적합한 형태
* Plain 스타일과 달리 헤더뷰와 푸터뷰가  Top, Bottom 에 고정되지 않음

![스크린샷 2019-12-17 오후 7.30.42](https://tva1.sinaimg.cn/large/006tNbRwgy1g9zwe660coj312g0n8h43.jpg)



## UITableViewDataSource

* 필수구현 메소드이자 데이터를 제공해주기 위한 프로토콜

```swift
func tableView(
 _ tableView: UITableView, numberOfRowsInSection section: Int
) -> Int {
// 섹션별 row 갯수 
}

func tableView(
 _ tableView: UITableView, cellForRowAt indexPath: IndexPath
) -> UITableViewCell {
// UITableViewCell 커스터마이징 
}
```



## UITableViewDelegate 

* 사용자가 터치하거나 행동을 하면 처리를 구현하는 프로토콜
* **Interaction** 과 관련된 동작을 커스터마이징하는 프로토콜

## UITableViewCell

* 식별자를 통해 셀을 구분해서 화면에 안나타나는 것을 재사용한다.
* 예를들어 만개의 아이템을 보여줘야 하는데 메모리에 10,000개를 전부 유지하면 메모리가 너무크다. 한 화면에 10개정도 보여지는데 나머지 9990개를 항상 유지하기엔 낭비.
  * **UITableViewCell Identifier**: Identifier(식별자)를 지정해줘서 재사용 할때 구분해서 사용
* **contentView** -> 더 나타내고 싶은 놈들을 올려서 사용

![uitableview2](https://tva1.sinaimg.cn/large/006tNbRwgy1g9zwywq19xj30u011sqi1.jpg)

