//
//  ViewController.swift
//  TableViewTestExample
//
//  Created by 은영김 on 2019/12/18.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}


//class TableViewBasic: UIViewController {
//    
//    override var description: String { "TableView - Basic" }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    let tableView = UITableView(frame: view.frame, style: .plain)
//    view.addSubview(tableView)
//    tableView.dataSource = self
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
//    
//    }
//}
//
//extension TableViewBasic: UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 50
//}
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    // 1. 매번 새로운 Cell생성
//    let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//    cell.textLabel?.text = "\(indexPath.row)"
//    return cell
//
//    // 2. 재사용
//    let cell: UITableViewCell
//    if let recell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//        cell = recell
//    } else {
//        cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//    }
//    cell.textLabel?.text = "\(indexPath.row)"
////    return cell
//    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//    cell.textLabel?.text = "\(indexPath.row)"
//    return cell
//    
//    
//  }
//}
//
