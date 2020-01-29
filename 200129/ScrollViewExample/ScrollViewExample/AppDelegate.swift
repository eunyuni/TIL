//
//  AppDelegate.swift
//  ScrollViewExample
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let tabbar = UITabBarController()
    
    let tableVC = TableViewController()
    let scrollVC = ScrollViewController()
    tableVC.tabBarItem = UITabBarItem(title: "TableView", image: nil, tag: 0)
    scrollVC.tabBarItem = UITabBarItem(title: "ScrollView", image: nil, tag: 0)
    
    tabbar.viewControllers = [tableVC, scrollVC]
    
    window?.rootViewController = tabbar
    window?.makeKeyAndVisible()
    
    return true
    
    
    
  }
  
  
  
}

