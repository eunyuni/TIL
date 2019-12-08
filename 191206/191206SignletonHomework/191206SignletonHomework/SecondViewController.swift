//
//  SecondViewController.swift
//  191206SignletonHomework
//
//  Created by 은영김 on 2019/12/06.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let shared = SecondViewController()
    
    var textValue = ""
    
    private let textLabel = UILabel()
    private let dismissButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseUI()
        
    }
    
    private func baseUI() {
        
        textLabel.frame = CGRect(x: 120, y: 200, width: 150, height: 80)
        textLabel.text = textValue
        print(textValue)
        textLabel.textColor = .purple
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        
        dismissButton.frame = CGRect(x: 120, y: 450, width: 180, height: 50)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.blue, for: .normal)
        dismissButton.titleLabel?.font = UIFont.init(name: "Arial", size: 50)
        dismissButton.addTarget(self, action: #selector(dismissButton(_:)), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    
    @objc private func dismissButton(_ sunder: UIButton) {
        dismiss(animated: true)
    }
    
    
    


}
