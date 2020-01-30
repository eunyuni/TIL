//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicCodeViewController: UIViewController {
  
  let itemCount = 100
//  var sizeSlider: UISlider!
  var collectionView: UICollectionView!
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSliders()
    setupCollectionView()
    setupNavigationItem()
  }

  // MARK: Setup Views
  
  func setupSliders() {
    let sizeSilder = UISlider()
    sizeSilder.minimumValue = 10
    sizeSilder.maximumValue = 200
    sizeSilder.value = 50
    
    let spacingSlider = UISlider()
    spacingSlider.minimumValue = 0
    spacingSlider.maximumValue = 50
    spacingSlider.value = 10
    spacingSlider.tag = 1
    
    let edgeSlider = UISlider()
    edgeSlider.minimumValue = 0
    edgeSlider.maximumValue = 50
    edgeSlider.value = 10
    edgeSlider.tag = 2
    
    let sliders = [sizeSilder, spacingSlider, edgeSlider]
    sliders.forEach {
      $0.addTarget(self, action: #selector(editLayout(_:)), for: .valueChanged)
    }
    
    let stackView = UIStackView(arrangedSubviews: sliders)
    view.addSubview(stackView)
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      stackView.widthAnchor.constraint(equalToConstant: 300)
    ])
  }
  
  
  func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 20  // 기본값 10
    layout.minimumInteritemSpacing = 10  // 기본값 10
    layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) // 기본값 0
    layout.itemSize = CGSize(width: 60, height: 60) // 기본값 ( 50,50)
  
    // offsetBy 뷰의프레임을 y의 250내린만큼 지정
    collectionView = UICollectionView(frame: view.frame.offsetBy(dx: 0, dy: 250), collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    view.addSubview(collectionView)
  }
  
  func setupNavigationItem() {
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply, target: self, action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItem = changeDirection
  }

  
  
  // MARK: Action
  
  @objc private func editLayout(_ sender: UISlider) {
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let value = CGFloat(sender.value)
    if sender.tag == 0 {
      let size = value
      layout.itemSize = CGSize(width: size, height: size)
    } else if sender.tag == 1 {
      layout.minimumLineSpacing = value
    } else {
      let inset = UIEdgeInsets(top: value, left: value, bottom: value, right: value)
      layout.sectionInset = inset
    }
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let direction = layout.scrollDirection
    layout.scrollDirection = (direction == .horizontal) ? .vertical : .horizontal
  }
}




// MARK: - UICollectionViewDataSource

extension BasicCodeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
    cell.backgroundColor = [.red, .green, .blue, .magenta, .gray, .cyan, .orange].randomElement()
    return cell
  }
}
