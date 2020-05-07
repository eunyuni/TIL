//
//  FitItemsViewController.swift
//  CollectionViewExample
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class FitItemsViewController: UIViewController {
  
  // 스트럭트나 이넘이나 구조체인데, init을 생성하지않고 확정된것만 사용하려고할때 enum으로 선언
  private enum UI {
    static let itemsInLine: CGFloat = 2
    static let linesOnScreen: CGFloat = 2
    static let itemSpacing: CGFloat = 10.0
    static let lineSpacing: CGFloat = 10.0
    static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
  }
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
  var parkImages = ParkManager.imageNames(of: .nationalPark)
  
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
    
    // view.safeAreaInset이 제대로 잡히지 않기때문에 여기서 setupFlowLayout 실행하지않고 아래서실행
  }
  
  // 여기부터 safeAreaInset적용되지만 네비게이션에따라 모양이변화되서 이상해짐
//  override func viewSafeAreaInsetsDidChange() {
//    super.viewSafeAreaInsetsDidChange()
//    setupFlowLayout()
//  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupFlowLayout()
  }
  
  // MARK: Setup CollectionView
  
  func setupCollectionView() {
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }
  
  func setupFlowLayout() {
    layout.minimumInteritemSpacing = UI.itemSpacing
    layout.minimumLineSpacing = UI.lineSpacing
    layout.sectionInset = UI.edgeInsets
    
    fitItemsAndLinesOnScreen()
  }
  
  func fitItemsAndLinesOnScreen() {
    
    let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
    let lineSpacing = UI.lineSpacing * (UI.linesOnScreen - 1)
//    let lineSpacing = UI.lineSpacing * (UI.linesOnScreen)
    let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
    
    // 도전과제 (10, 50, 80)
    let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom
      + view.safeAreaInsets.top
//      + 10
//      + 50
//      + 80
      + view.safeAreaInsets.bottom  // 노치가 있는 기기와 없는 기기로 구분
    
    let isVertical = layout.scrollDirection == .vertical
    let horizontalSpacing = (isVertical ? itemSpacing : lineSpacing) + horizontalInset
    let verticalSpacing = (isVertical ? lineSpacing : itemSpacing) + verticalInset
    
    let contenWidth = collectionView.frame.width - horizontalSpacing
    let contenHeight = collectionView.frame.height - verticalSpacing
    let width = contenWidth / (isVertical ? UI.itemsInLine : UI.linesOnScreen)
    let height = contenHeight / (isVertical ? UI.linesOnScreen : UI.itemsInLine)
    
    layout.itemSize = CGSize(
      width: width.rounded(.down) - 1,
      height: height.rounded(.down) - 1
    )
  }
  
  
  // MARK: Setup NavigationItem
  
  func setupNavigationItem() {
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItems = [changeDirection]
  }
  
  // MARK: - Action
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = layout.scrollDirection
    layout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
    setupFlowLayout()
  }
}


// MARK: - UICollectionViewDataSource

extension FitItemsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier,
      for: indexPath
      ) as! CustomCell
    
    let item = indexPath.item % parkImages.count
    cell.configure(image: UIImage(named: parkImages[item]),
                   title: parkImages[item])
    cell.backgroundColor = .black
    
    
    return cell
  }
}



