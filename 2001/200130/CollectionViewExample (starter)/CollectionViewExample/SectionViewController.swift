//
//  SectionViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class SectionViewController: UIViewController {
  
  // CollectionView 설정
  
  let states = ParkManager.imageNames(of: .state)
  let parkList = ParkManager.list
  
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
  
  let layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
    layout.minimumInteritemSpacing = 15
    layout.minimumLineSpacing = 15
    layout.itemSize = CGSize(width: 150, height: 150)
    
    // 기본 0 -> 만들어지지 않음
    layout.headerReferenceSize = CGSize(width: 60, height: 60)
    layout.footerReferenceSize = CGSize(width: 50, height: 50)
    // 헤더가 바꿀때 밀려나도록 고정
    layout.sectionHeadersPinToVisibleBounds = true
//    layout.sectionFootersPinToVisibleBounds = true
    return layout
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  func setupCollectionView() {
    collectionView.register(
      SectionCell.self,
      forCellWithReuseIdentifier: SectionCell.identifier
    )
    collectionView.register(
      SectionHeaderView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: SectionHeaderView.identifier
    )
    collectionView.register(
      SectionFooterView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: SectionFooterView.identifier
    )
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }
}

// MARK: - UICollectionViewDataSource

extension SectionViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return states.count
  }
  
  // 주에따라서 공원이 몇개인지 체크
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // 주의 이름과 공원의 위치가 같으면 카운트
    let parks = parkList.filter({ $0.location.rawValue == states[section] })
    return parks.count * 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.identifier, for: indexPath
      ) as! SectionCell
    
    let parks = parkList.filter { $0.location.rawValue == states[indexPath.section ]}
    let parkName = parks[indexPath.item % parks.count].name
    cell.configure(image: UIImage(named: parkName),
                   title: parkName)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: SectionHeaderView.identifier,
        for: indexPath
        ) as! SectionHeaderView
      
      let state = states[indexPath.section]
      header.configure(image: UIImage(named: state), title: state)
      return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: SectionFooterView.identifier,
        for: indexPath) as! SectionFooterView
      
      let count = parkList
        .filter({ $0.location.rawValue == states[indexPath.section]}).count * 2
      let title = "총 \(count)개 이미지"
      footer.configure(title: title)
      return footer
    }
  }
}

