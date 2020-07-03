//
//  CustomTableViewCell.swift
//  RxswiftExample
//
//  Created by 은영김 on 2020/07/03.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "productCell"
  
  let categoryLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    $0.textColor = .gray
  }
  
  let productNameLeble = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    $0.textColor = .black
  }
  
  let summaryLable = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    $0.textColor = .gray
  }
  
  let priceLable = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    $0.textColor = .red
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(categoryLabel)
    addSubview(productNameLeble)
    addSubview(summaryLable)
    addSubview(priceLable)
    setupConstraints()
  }
  
  private func setupConstraints() {
    categoryLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(20)
    }
    productNameLeble.snp.makeConstraints {
      $0.top.equalTo(categoryLabel.snp.bottom).offset(10)
      $0.leading.equalTo(categoryLabel)
    }
    summaryLable.snp.makeConstraints {
      $0.top.equalTo(productNameLeble.snp.bottom).offset(10)
      $0.leading.equalTo(categoryLabel)
    }
    priceLable.snp.makeConstraints {
      $0.top.equalTo(summaryLable.snp.bottom).offset(10)
      $0.trailing.equalToSuperview().offset(-20)
    }
  }
}
