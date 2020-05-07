//
//  MainTabBarViewController.swift
//  DominoUpdate
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  
  // 앱댈리게이트에서 탭바컨트롤러를 생성한것과 같음..
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let categoryVC = UINavigationController(rootViewController: CategoryTableViewController())
    let sectionVC = UINavigationController(rootViewController: SectionViewController())
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    let jsonVC = UINavigationController(rootViewController: JsonViewController())
    categoryVC.tabBarItem = UITabBarItem(title: "Categoty", image: nil, tag: 0)
    sectionVC.tabBarItem = UITabBarItem(title: "Section", image: nil, tag: 0)
    wishListVC.tabBarItem = UITabBarItem(title: "WishList", image: nil, tag: 0)
    jsonVC.tabBarItem = UITabBarItem(title: "Json", image: nil, tag: 0)
    
    self.viewControllers = [categoryVC, sectionVC, jsonVC, wishListVC]
  }
  
}
