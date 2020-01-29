//
//  SectionViewController.swift
//  DominoUpdate
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
  
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    navigationSet()
    configure()
    autoLayout()  // setConstraint
  }
  private func navigationSet() {
    navigationItem.title = "Domino's [Section]"
  }
  
  private func configure() {
    tableView.dataSource = self
    tableView.delegate = self
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

extension SectionViewController: UITableViewDataSource {
  // 메뉴데이터의 뭉텅이를 세션으로 나눠서 세션으로만듬
  func numberOfSections(in tableView: UITableView) -> Int {
    return menuData.count
  }
  
  // 각섹션에있는 프로덕트의 갯수들의 카운트
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuData[section].products.count
  }
  
  // 갯수만큼 셀을 만들어서 셀을 그려주는
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    // 해당셀의 섹션에 프로덕트의 로우에맞는 상품을 가져와서 맞는 이미지를 넣고, 텍스트 서브타이틀을 넣음
    let product = menuData[indexPath.section].products[indexPath.row]
    cell.imageView?.image = UIImage(named: product.name)
    cell.textLabel?.text = product.name
    cell.detailTextLabel?.text = String(product.price) + " 원"
    cell.selectionStyle = .none
    
    return cell
  }
}

// 눌렀을때 상세페이지로 들어감
extension SectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//    let detailVC = DetailViewController()
//    let name = menuData[indexPath.section].products[indexPath.row].name
//    detailVC.title = name
//    detailVC.imageView.image = UIImage(named: name)
//    detailVC.productName = name
    
    let name = menuData[indexPath.section].products[indexPath.row].name
    let detailVC = DetailViewController(productName: name)
  
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  // viewForHeaderInSection -> 이미지를 띄우는
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let herderView = UIImageView()
    herderView.backgroundColor = .white
    herderView.image = UIImage(named: menuData[section].category)
    herderView.contentMode = .scaleAspectFit
    return herderView
  }
  
  // 섹션의 높이..
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}
