//
//  ProductTableViewController.swift
//  DominoUpdate
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
  
  private let products: [Product]
  
  init(menu: Menu) {
    self.products = menu.products
    super.init(nibName: nil, bundle: nil)
    
    navigationItem.title = menu.category
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 선택된 회색음영이 남도록 -> false, 지우도록 -> true
    self.clearsSelectionOnViewWillAppear = false
  }
  
  // 각메뉴의 카테고리별 섹션
  //    override func numberOfSections(in tableView: UITableView) -> Int {
  //      menuData[IndexPath]
  //        return 0
  //    }
  
  //
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    products.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    // 해당셀의 섹션에 프로덕트의 로우에맞는 상품을 가져와서 맞는 이미지를 넣고, 텍스트 서브타이틀을 넣음
    let product = products[indexPath.row]
    cell.imageView?.image = UIImage(named: product.name)
    cell.textLabel?.text = product.name
    cell.detailTextLabel?.text = String(product.price) + " 원"
//    cell.selectionStyle = .none
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    120
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let name = products[indexPath.row].name
    let detailVC = DetailViewController(productName: name)
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  
  
}
