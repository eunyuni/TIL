//
//  TwoTableViewSection.swift
//  TableViewTestExample
//
//  Created by 은영김 on 2019/12/18.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class TwoTableViewSection: UIViewController {

    override var description: String { "Two Section 복습" }
    
    lazy var sectionTitles = stationDict.keys.sorted()
    
    let stationDict = [
        "1호선": ["신길", "소요산"],
        "2호선": ["까치산", "신도림", "성수"],
        "3호선": ["수유리?"],
        "4호선": ["이건모르겠음.."],
        "5호선": ["화곡", "방화", "왕십리", "영등포시장"]
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame, style: .plain)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        
        
    }
}

extension TwoTableViewSection: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("stationDict: \(stationDict)","\n")
        print("stationDict.count: \(stationDict.count)","\n")
        print("sectionTitles: \(sectionTitles)","\n")
        print("sectionTitles.count: \(sectionTitles.count)","\n")
        return stationDict.count
    }
    
    /// 섹션의 행의 갯수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // key, value 를 각각 찾아야함
//        let key = sectionTitles[section]
//        return stationDict[key]!.count
        return stationDict[sectionTitles[section]]!.count
    }
    
    /// 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        //테이블뷰의 cellid의 identifier를 가진놈이있으면 그만큼을 셀에 넣어라.
        let station = stationDict[sectionTitles[indexPath.section]]!
        //스테이션 = 스테이션덱셔너리[[스테이션타이틀(1~5호선)의 섹션]]
        cell.textLabel?.text = "\(station[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
}
