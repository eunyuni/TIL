//
//  CategoryViewController.swift
//  DominoUpdate
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    configure()
    navigationSet()
    autoLayout()
  }
  
  private func navigationSet() {
    title = "Category"
  }
  private func configure() {
    //    tableView.dataSource = self
    //    tableView.delegate = self
    view.addSubview(tableView)
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

extension CategoryViewController: UITableViewDataSource {
  
  // 메뉴데이터의 뭉텅이를 세션으로 나눠서 세션으로만듬
  //  func numberOfSections(in tableView: UITableView) -> Int {
  //    return menuData.count
  //    //  menuData[section].products.count
  //  }
  
//  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    let herderView = UIImageView()
//    herderView.backgroundColor = .white
//    herderView.image = UIImage(named: menuData[section].category)
//    herderView.contentMode = .scaleAspectFit
//    return herderView
//  }
  //
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuData[section].category.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    // 해당셀의 섹션에 프로덕트의 로우에맞는 상품을 가져와서 맞는 이미지를 넣고, 텍스트 서브타이틀을 넣음
//    let product = menuData[indexPath.section].category[indexPath.row]
//    cell.imageView?.image = UIImage(named: menuData[section].category)
//    cell.textLabel?.text = product.name
//    cell.detailTextLabel?.text = String(product.price) + " 원"
//    cell.selectionStyle = .none
    
    return cell
  }
  
  
  
  
  
}
