//
//  ViewController.swift
//  DelegateExample
//
//  Created by 은영김 on 2020/04/02.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let myView = CoustomView()
  let myView1 = UIView()
  let textField = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
//    myView.frame = CGRect(x: 40, y: 80, width: 160, height: 160)
    
    myView.backgroundColor = .systemBlue
    myView.backgroundColor = .red // -> blue
    myView.backgroundColor = nil // -> gray
    
    // 2. delegate = self
    myView.delegate = self
    myView.backgroundColor = .red
    
    myView1.backgroundColor = .yellow
    textField.borderStyle = .roundedRect
    setUI()
    
    textField.delegate = self
  }
  
  private func setUI() {
    
    view.addSubview(myView)
    view.addSubview(myView1)
    view.addSubview(textField)
    
    let guide = view.safeAreaLayoutGuide
    
    myView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      myView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
      myView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      myView.widthAnchor.constraint(equalToConstant: 300),
      myView.heightAnchor.constraint(equalToConstant: 100)
    ])
    
    myView1.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      myView1.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20),
      myView1.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      myView1.widthAnchor.constraint(equalToConstant: 340),
      myView1.heightAnchor.constraint(equalToConstant: 100)
    ])
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: myView1.bottomAnchor, constant: 40),
      textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      textField.widthAnchor.constraint(equalToConstant: 340),
      textField.heightAnchor.constraint(equalToConstant: 50)
    ])

  }
  
}

// MARK: -CustomViewDelegate

// 1. Delegate 프로토콜 채택
extension ViewController: CustomViewDelegate {
  func colorForBackground(_ newColor: UIColor?) -> UIColor {
    guard let color = newColor else {
      return .black
    }
    return color == .red ? .blue : color
  }
}

// MARK: -UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
  
  // return눌렀을때 return을 할건지 말건지
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // 키보드 내리기
    textField.resignFirstResponder()
    return true
  }
  
  // textfield종료시 호출
  func textFieldDidEndEditing(_ textField: UITextField) {
//    if textField.text == "red" {
//      myView1.backgroundColor = .red
//    } else if textField.text == "orang" {
//      myView1.backgroundColor = .orange
//    } else {
//      myView1.backgroundColor = .gray
//    }
    guard let text = textField.text else { return }
    switch text {
    case "red": myView1.backgroundColor = .red
    case "blue": myView1.backgroundColor = .orange
    case "black": myView1.backgroundColor = .black
    default: myView1.backgroundColor = .gray
    }
  }
  
  // 내가원하는 글자를 입력못하도록 할수있음
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//
//    // a는 입력못하도록
//    return string == "a" ? false : true
//  }
  
  
}
