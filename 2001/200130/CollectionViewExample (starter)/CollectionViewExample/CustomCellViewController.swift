//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CustomCellViewController: UIViewController {
  
  let flowLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(
    frame: view.frame, collectionViewLayout: flowLayout
  )
  
  let itemCount = 120
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  var showImage = false
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }
  
  // MARK: Setup Views
  
  private func setupCollectionView() {
    setupFlowLayout()
    
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    view.addSubview(collectionView)
  }
  
  private func setupFlowLayout() {
    if showImage {
      flowLayout.minimumLineSpacing = 20
      flowLayout.minimumInteritemSpacing = 15
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
      flowLayout.itemSize = CGSize(width: 120, height: 120)
      
    } else {
      flowLayout.minimumLineSpacing = 20
      flowLayout.minimumInteritemSpacing = 10
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
      flowLayout.itemSize = CGSize(width: 60, height: 60)
    }
  }
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(
      barButtonSystemItem: .refresh,
      target: self,
      action: #selector(changeCollectionViewItems(_:))
    )
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItems = [changeItem, changeDirection]
  }
  
  // MARK: Action
  
  @objc private func changeCollectionViewItems(_ sender: Any) {
    showImage.toggle()
    setupFlowLayout()
    collectionView.reloadData()
    
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = flowLayout.scrollDirection
    flowLayout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
  }
  
  func color(at indexPath: IndexPath) -> UIColor {
    let max = itemCount
    let currentIndex = CGFloat(indexPath.item)
    
    // 최소값 0.1 ~ 최대값 0.9
    let factor = 0.1 + (currentIndex / CGFloat(max)) * 0.8
    //    let factor = currentIndex / CGFloat(max)
    
    return .init(hue: factor, saturation: 1, brightness: 1, alpha: 1)
    //hue: 색상, saturation: 채도, brightness: 명도
  }
}

// MARK: - UICollectionViewDataSource

extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell!
    if showImage {
      let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
      let item = indexPath.item % parkImages.count
      print(item)
      customCell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
      // 커스텀셀에 데이터 넣는 코드
      cell = customCell
    }else{
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
      cell.layer.cornerRadius = cell.frame.width / 2
    }
    cell.backgroundColor = color(at: indexPath)
    return cell
    
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.alpha = 0
    cell.transform = .init(scaleX: 0.3, y: 0.3)
    
    UIView.animate(withDuration: 0.6) {
      cell.alpha = 1
      cell.transform = .identity
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    // 가운데애만 4배로 커지도록
    if indexPath.item % 5 == 2 {
      return layout.itemSize.applying(.init(scaleX: 2, y: 2))
    } else {
      return layout.itemSize
    }
  }
}


