//
//  TableViewSection.swift
//  TableViewTestExample
//
//  Created by 은영김 on 2019/12/18.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class TableViewSection: UIViewController {

    override var description: String { "TableView - Section" }
    
    lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
    let fruitsDict = [
        "가": ["가지", "가로수", "가양역"],
        "나": ["나이", "나선"],
        "다": ["다람쥐", "다리미", "다수"],
        "라": ["라디오", "라디에이터"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
}

// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    
    /// 딕셔너리의 숫자만큼 보여줌 / 섹션의 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        fruitsDict.count
    }
    
    /// 섹션의 행의 갯수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = fruitsDict.keys.sorted() // [A, B, C, D]
        let key = titles[section]             // titles[0] - A // titles[1] - B
        return fruitsDict[key]!.count
        
//        return fruitsDict[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let fruits = fruitsDict[sectionTitles[indexPath.section]]!
        cell.textLabel?.text = "\(fruits[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
}



