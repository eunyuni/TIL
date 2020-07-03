//
//  ViewController.swift
//  RxswiftExample
//
//  Created by 은영김 on 2020/06/18.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx


class ViewController: UIViewController {
  
  let listTableView = UITableView()
  
  let priceFormatter: NumberFormatter = {
    let f = NumberFormatter()
    f.numberStyle = NumberFormatter.Style.currency
    f.locale = Locale(identifier: "Ko_kr")
    
    return f
  }()
  
//  let bag = DisposeBag()
  
  let nameObservable = Observable.of(appleProducts.map{($0.name )
  })
  let productObservable = Observable.of(appleProducts)
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "standardCell")
    //    nameObservable.bind(to: listTableView.rx.items) { tableView, row, element in
    //      let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell")!
    //      cell.textLabel?.text = element
    //      return cell
    //    }
    //    .disposed(by: rx.disposeBag) // let bag = DisposeBag() 이과정을 생략해줌
    
    //bind == ui관련 작업에서의 subscribe이다. -> error을 리턴하지않음. 언제나이벤트를 받고, 구독이끊기지않음. 계속 반응이이뤄짐
    
    listTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    listTableView.rowHeight = 180
    
    
    
    setupUI()
  }


  private func setupUI() {
    
    view.addSubview(listTableView)
    productObservable.bind(to: listTableView.rx.items(cellIdentifier: CustomTableViewCell.identifier, cellType: CustomTableViewCell.self)) { [weak self] row, element, cell in
      cell.categoryLabel.text = element.category
      cell.productNameLeble.text = element.name
      cell.summaryLable.text = element.summary
      cell.priceLable.text = self?.priceFormatter.string(from: NSNumber(value: element.price))
    }
    .disposed(by: rx.disposeBag)
    
    // 최대 8개의 옵져버블을 하나로 합쳐줌. 순서보장됨.
    // modelSelected == 셀에해당하는정보
    Observable.zip(listTableView.rx.modelSelected(Product.self), listTableView.rx.itemSelected)
      .bind { [weak self] (product, indexPath) in
        //누르면 빤짝함, 회색표시 말고
        self?.listTableView.deselectRow(at: indexPath, animated: true)
        print(product.name)
    }
    .disposed(by: rx.disposeBag)

//    listTableView.delegate = self
    listTableView.rx.setDelegate(self)
      .disposed(by: rx.disposeBag)
    
    setupContstraints()
  }
  
  private func setupContstraints(){
    listTableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
  }
}


extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(#function)
  }
}
