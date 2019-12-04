//
//  ViewController.swift
//  191124newtest
//
//  Created by 은영김 on 2019/12/04.
//  Copyright © 2019 eunyuni. All rights reserved.
//
//1. Button을 누를 때마다 Label 의 값 변경하기
//1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
//2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경


import UIKit


class ViewController: UIViewController {

    private var count = 1
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func plusButton(_ sender: UIButton) {
        count += 1
        countLabel.text = String(count)
        countLabel.textColor = .red
        sender.setTitleColor(.systemPink, for: .highlighted)
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        count -= 1
        countLabel.text = String(count)
        countLabel.textColor = .blue
    }
    
    
}

