//
//  ThreeTableViewSection.swift
//  TableViewTestExample
//
//  Created by 은영김 on 2019/12/18.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ThreeTableViewSection: UIViewController {

    lazy var applelist = appleDict.keys.sorted()
    
    let appleDict = [
        "아이폰": ["아이폰8", "아이폰X", "아이폰XR"],
        "맥북": ["맥북프로", "맥북에어"],
        "아이패드": ["아이패드", "아이패드프로"],
        "기타": ["허브", "이어폰", "마우스", "키보드", "스탠드"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame, style: .plain)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
 
    }
}

extension ThreeTableViewSection: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        appleDict.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = applelist[section]
        return appleDict[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let apple = appleDict[applelist[indexPath.section]]!
        cell.textLabel?.text = "\(apple[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        applelist[section]
    }
}

