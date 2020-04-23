//
//  TableViewBasic.swift
//  TableViewTestExample
//
//  Created by 은영김 on 2019/12/18.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class TableViewBasic: UIViewController {
    
  override var description: String { "TableView - Basic" }

    let data = Array(1...50)
    
  override func viewDidLoad() {
    super.viewDidLoad()

    let tableView = UITableView(frame: view.frame, style: .plain)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    
    }
}
extension TableViewBasic: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell
//        if let recell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//            cell = recell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    
}



