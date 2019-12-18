# 191218 TableView 연습

(4번이나 반복했다구.......... .......돌대가리다ㅠㅠㅠㅠㅠ)

![tableviewexample](https://tva1.sinaimg.cn/large/006tNbRwgy1ga15p956t8j31yy0to4k9.jpg)

```swift
extension ThreeTableViewSection: UITableViewDataSource {
    
// 딕셔너리의 숫자만큼 섹션에 나타내줌
    func numberOfSections(in tableView: UITableView) -> Int {
        appleDict.count
    }
    
// 섹션의 행의 갯수를 반환 inSection의 row를 number만큼?..?응 그런거임 ㅇㅇ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = applelist[section]
        return appleDict[key]!.count
    }
    
// 행을 cell로 가져오기(?)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
// 테이블뷰의 cellid의 identifier를 가진놈이있으면 그만큼을 셀에 넣어라.
        let apple = appleDict[applelist[indexPath.section]]!
// 스테이션 = 스테이션덱셔너리[[스테이션타이틀(1~5호선)의 섹션]
        cell.textLabel?.text = "\(apple[indexPath.row])"
        return cell
    }
    
// 섹션의 각 타이틀 지정...ㄷ점랴ㅐㄷㅈ머ㅑㅐ럼ㄴ야ㅐㄹ ㅠㅠ 졸래어려움!
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        applelist[section]
    }
}
```

