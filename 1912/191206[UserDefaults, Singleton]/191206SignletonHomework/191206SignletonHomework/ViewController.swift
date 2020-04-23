//
//  ViewController.swift
//  191206SignletonHomework
//
//  Created by 은영김 on 2019/12/06.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textfield = ""
    
    private let textField = UITextField()
    private let userDefaultsButton = UIButton()
    private let singletonButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BaseUI()
        
    }
    
    private func BaseUI() {
        
        textField.frame = CGRect(x: 60, y: 150, width: 300, height: 40)
//        textField.backgroundColor = .black
        textField.borderStyle = .roundedRect
        textField.textColor = .darkGray
        view.addSubview(textField)
        
        userDefaultsButton.frame = CGRect(x: 120, y: 350, width: 180, height: 50)
        userDefaultsButton.setTitle("userDefaults", for: .normal)
        userDefaultsButton.setTitleColor(.brown, for: .normal)
        userDefaultsButton.addTarget(self, action: #selector(udActionButton(_:)), for: .touchUpInside)
        view.addSubview(userDefaultsButton)
        
        singletonButton.frame = CGRect(x: 120, y: 450, width: 180, height: 50)
        singletonButton.setTitle("singleton", for: .normal)
        singletonButton.setTitleColor(.gray, for: .normal)
        singletonButton.addTarget(self, action: #selector(stActionButton(_:)), for: .touchUpInside)
        view.addSubview(singletonButton)
        
    }
    
    @objc private func udActionButton(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .automatic
        secondVC.textValue = self.textField.text!
///       guard let secondVC = presentingViewController as? SecondViewController else {return}
        present(secondVC, animated: false)
    }
    
    @objc private func stActionButton(_ sender: UIButton) {
        SecondViewController.shared.textValue = self.textField.text!
        SecondViewController.shared.modalPresentationStyle = .fullScreen
        
        present(SecondViewController.shared, animated: false)
        }


}

