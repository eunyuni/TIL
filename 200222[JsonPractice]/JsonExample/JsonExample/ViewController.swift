//
//  ViewController.swift
//  JsonExample
//
//  Created by 은영김 on 2020/02/21.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    user()
    test()
    
  }
  
  func user() {
    // 덜꺼냈음 ㅎ
    let decoder = JSONDecoder()
    do {
      let user = try decoder.decode(User.self, from: jsonData)
      print(user)
      print(user.leagues.standard.confName)
      dump(user)
      
      
    }catch {
      print(error)
      print(error.localizedDescription)
    }
  }
  
  func test() {
    // 좀더 꺼냇음
    let decoder = JSONDecoder()
  
    do {
      let test = try decoder.decode(Test.self, from: jsonDataTest)
      print(test)
    } catch {
      print(error.localizedDescription)
    }
  }
}
