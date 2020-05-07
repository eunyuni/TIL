//
//  FlexibleViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class FlexibleViewController: UIViewController {
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
  var parkImages = ParkManager.imageNames(of: .nationalPark)
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  // MARK: Setup CollectionView
  
  func setupCollectionView() {
    setupFlowLayout()
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }
  
  // 하나의 아이템에 몇개의 라인을 넣을것인지
  func setupFlowLayout() {
    let itemInline: CGFloat = 5
    let spcing: CGFloat = 5
    let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    let cvWidth = collectionView.bounds.width
    let contenSize = cvWidth - insets.left - insets.right - (spcing * (itemInline - 1))
    let itemSize = (contenSize / itemInline).rounded(.down) // rounded 소수점 버리기 (내림)
    
    layout.minimumLineSpacing = spcing
    layout.minimumInteritemSpacing = spcing
    layout.sectionInset = insets
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
  }
}


// MARK: - UICollectionViewDataSource

extension FlexibleViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier, for: indexPath
      ) as! CustomCell
    cell.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)

    let item = indexPath.item % parkImages.count
    cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
    
    return cell
  }
}



