//
//  ReorderingViewController.swift
//  CollectionViewExample
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ReorderingViewController: UIViewController {
  
  var parkImages = ParkManager.imageNames(of: .nationalPark)
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    cv.backgroundColor = .white
    cv.dataSource = self
    view.addSubview(cv)
    return cv
  }()
  
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupFlowLayout()
    setupLongPressGestureRecognizer()
  }
  
  
  // MARK: Setup FlowLayout
  
  func setupFlowLayout() {
    let itemInline: CGFloat = 4
    let spcing: CGFloat = 5
    let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    // collectionView를 한번이라도 부르지않으면 lazy가 불려지지않음..
    let cvWidth = collectionView.bounds.width
    let contenSize = cvWidth - insets.left - insets.right - (spcing * (itemInline - 1))
    let itemSize = (contenSize / itemInline).rounded(.down) // rounded 소수점 버리기 (내림)
    
    layout.minimumLineSpacing = spcing
    layout.minimumInteritemSpacing = spcing
    layout.sectionInset = insets
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
  }
  
  // MARK: Setup Gesture
  
  func setupLongPressGestureRecognizer() {
    let gesture = UILongPressGestureRecognizer(
      target: self, action: #selector(reorderCollectionViewItem(_:))
    )
    // 0.2동안 눌러야 인식
    gesture.minimumPressDuration = 0.2
    collectionView.addGestureRecognizer(gesture)
  }
  
  
  
  // MARK: - Action
  
  @objc private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
    let location = sender.location(in: collectionView)
    switch sender.state {
    case .began: //누른상태일때
      guard let indexPath = collectionView.indexPathForItem(at: location) else { break }
      collectionView.beginInteractiveMovementForItem(at: indexPath)
    case .changed: // 움직이고나면
      collectionView.updateInteractiveMovementTargetPosition(location)
    case .cancelled:
      collectionView.cancelInteractiveMovement()
    case .ended: // 종료되면
      collectionView.endInteractiveMovement()
    default:
      break
    }
  }
}

// MARK: - UICollectionViewDataSource

extension ReorderingViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier, for: indexPath
      ) as! CustomCell
    
    let item = indexPath.item % parkImages.count
    cell.configure(image: UIImage(named: parkImages[item]),
                   title: parkImages[item])
    cell.backgroundColor = .black
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else { return }
    let source = sourceIndexPath.item % parkImages.count
    let destination = destinationIndexPath.item % parkImages.count
    print("source:", source, "dest:", destination)
    
    let element = parkImages.remove(at: source)
    parkImages.insert(element, at: destination)
  }
  
  // 이동할수잇을지없을지
  //  func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
  //    <#code#>
  //  }
  
  
  
}
