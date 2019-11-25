//
//  ViewController.swift
//  191125ViewController
//
//  Created by 은영김 on 2019/11/25.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

var count = 0


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        mainLabel()
        appleButton()

        
    }
    let label = UILabel()
    let button = UIButton()

    
    
    func mainLabel() {
        super.viewDidLoad()
         label.frame = CGRect(x: 120, y: 200, width: 200, height: 200)
         label.text = "0"
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .systemPink
        view.addSubview(label)
        
    }
    
    func appleButton() {
        super.viewDidLoad()

        button.frame = CGRect(x: 80, y: 450, width: 200, height: 300)
        button.center = view.center
        button.setTitle("넘어갈거임", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(tpaButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tpaButton(_ a: UIButton) {
        let nextV = AViewController()
        nextV.modalPresentationStyle = .fullScreen
        nextV.view.backgroundColor = .systemPink
        present(nextV, animated: true) //  이동
        view.addSubview(label)
        
    }
    
//func
//    button.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
//    button.center = view.center
//    button.setTitle("Button", for: .normal)
//    button.addTarget(self, action:
//    #selector(didTapButton(_:)), for: .touchUpInside)
//    view.addSubview(button)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        count += 1
        label.text = String(count)
    }
    
    
    
    
}

