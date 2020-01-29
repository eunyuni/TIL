//
//  ScrollViewController.swift
//  ScrollViewExample
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

  
  private let scrollView = UIScrollView()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
      setUI()
      makeLabels()
    }
  
  private func setUI() {
    view.backgroundColor = .white
    
    view.addSubview(scrollView)
    let guide = view.safeAreaLayoutGuide
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
  
  private func makeLabels() {
    var labels = [UILabel]()
    
    // cellforrowat에서 하는작업(?)
    for menu in menuData {
      let sectionLabel = UILabel()
      sectionLabel.text = menu.category
      sectionLabel.backgroundColor = .lightGray
      labels.append(sectionLabel)
      scrollView.addSubview(sectionLabel)
      
      sectionLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
      
      for product in menu.products {
        let rowLabel = UILabel()
        rowLabel.text = product.name
        labels.append(rowLabel)
        scrollView.addSubview(rowLabel)
        
        rowLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
      }
    }
    
    for (index, label) in labels.enumerated() {
      label.translatesAutoresizingMaskIntoConstraints = false
      label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
      label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
      label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
      label.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
      
      switch index {
      case 0:
        label.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
      case labels.count - 1:
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        fallthrough
        
      default:
        label.topAnchor.constraint(equalTo: labels[index - 1].bottomAnchor).isActive = true
      }
    }
    
    
  }
}
