//
//  AViewController.swift
//  191125ViewController
//
//  Created by 은영김 on 2019/11/25.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        mainLabel()
        appleButton()
        
        count += 1
        label.text = String(count)
        
    }
    let label = UILabel()
    let button = UIButton()
    
    
    func mainLabel() {
        super.viewDidLoad()
         label.frame = CGRect(x: 120, y: 200, width: 200, height: 200)
         label.text = "0"
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .systemGray2
        view.addSubview(label)
        
    }
    
    func appleButton() {
        super.viewDidLoad()

        button.frame = CGRect(x: 80, y: 450, width: 200, height: 300)
        button.center = view.center
        button.setTitle("돌아갈거임", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
        
    @objc private func buttonAction(_ a: UIButton) {
            let nextA = ViewController()

//            nextA.modalPresentationStyle = .fullScreen
            nextA.view.backgroundColor = .systemGray6

//            guard let vc = presentingViewController as? ViewController else { return }
//            vc.button.setTitle("PLUS+1", for: .normal)
//            let cc = vc.label.text
//           view.addSubview(String(cc))
//        view.addSubview(button)
        
            dismiss(animated: true)//이전으로 돌아감
        }
        
   
        
        
    }
    
//    @objc private func tpaButton(_ a: UIButton) {
//        count += 1
//        label.text = String(count)
//        label.textColor = .systemPink
//
////        button.addTarget(self, action: , for: )
//
    
    

    
//func
//    button.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
//    button.center = view.center
//    button.setTitle("Button", for: .normal)
//    button.addTarget(self, action:
//    #selector(didTapButton(_:)), for: .touchUpInside)
//    view.addSubview(button)

    
    
    


