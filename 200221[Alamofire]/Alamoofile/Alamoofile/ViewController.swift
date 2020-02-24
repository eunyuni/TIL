//
//  ViewController.swift
//  Alamoofile
//
//  Created by 은영김 on 2020/02/21.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit
import Alamofire

//Date(timeIntervalSinceReferenceDate: <#T##TimeInterval#>) 2000. 01. 01 이후
//Date(timeIntervalSince1970: <#T##TimeInterval#>) 1970. 01. 01 이후

class ViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView!
  private var users: [User] = [] {
    didSet { tableView.reloadData() }
  }
  private let serviceManger = ServiceManager.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 60
    
    serviceManger.requestUser { [weak self] result in
      switch result {
      case .success(let users):
        self?.users = users
      case .failure(let error):
        print(error)
      }
    }
//    test()
  }
  
  func test() {
   let decoder = JSONDecoder()
  do {
    let user = try decoder.decode(User.self, from: jsonData)
  print(user)

  } catch {
    print(error)
    }
  }
  
  func requestCellData(_ cell: UITableViewCell, for indexPath: IndexPath) {
    let user = users[indexPath.row]
    // 이미지만 가져오는 함수를 만듬
    serviceManger.requestImage(user.photo) { [weak self] response in
      guard let data = try? response.get() else { return }
      
      // 이미지를 받아오는데 시간이걸리는데 빠르게올리면 가져온데이터가 사라질수있으니, 재사용하게되면서 이상하게 이미지가 들어갈수있다. 현재셀이 내가 요청한 셀과맞는지 체크를해서 남아있을경우(화면에 보여질경우) 이미지를 집어넣겠다.
      if let cell = self?.tableView.cellForRow(at: indexPath) {
        cell.imageView?.image = UIImage(data: data)
        cell.textLabel?.text = user.fullName
        cell.detailTextLabel?.text = user.email
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    requestCellData(cell, for: indexPath)
    return cell
  }
  
  
}
