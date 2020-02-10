//
//  firstViewController.swift
//  191124newtest
//
//  Created by 은영김 on 2019/12/04.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    let myLavel = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        basicUI()
    }
    
    private func basicUI(){
        myLavel.textColor = .black
        myLavel.frame = CGRect(x: 150, y: 100, width: 100, height: 100)
        myLavel.text = "0"
        myLavel.font = .systemFont(ofSize: 50)
        view.addSubview(myLavel)
        
        plusButton.frame = CGRect(x: 100, y: 250, width: 50, height: 50)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.blue, for: .normal)
        plusButton.addTarget(self, action: #selector(didTapPlus(_:)), for: .touchUpInside)
        plusButton.titleLabel?.font = .systemFont(ofSize: 80)
        view.addSubview(plusButton)
        
        minusButton.frame = CGRect(x: 180, y: 250, width: 50, height: 50)
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.blue, for: .normal)
        minusButton.addTarget(self, action: #selector(didTapMinus(_:)), for: .touchUpInside)
        minusButton.titleLabel?.font = .systemFont(ofSize: 80)
        view.addSubview(minusButton)
    }
    
    @objc func didTapPlus(_ sender: UIButton) {
        count += 1
        myLavel.text = String(count)
        myLavel.textColor = .red
    }
    @objc func didTapMinus(_ sender: UIButton) {
        count -= 1
        myLavel.text = String(count)
        myLavel.textColor = .blue
    

}
}
