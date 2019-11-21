//
//  ViewController.swift
//  BlueRedButton
//
//  Created by 은영김 on 2019/11/21.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet weak var newLable: UILabel!
    
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        newLable.text = String(count)
        newLable.textColor = .systemBlue
        
        
    }
    
    @IBAction func minusButton(_ sender: Any) {
        count -= 1
        newLable.text = String(count)
        newLable.textColor = .systemRed
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray2
        
        newLable.text = "0"
        
    }


}

