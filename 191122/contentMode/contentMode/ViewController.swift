//
//  ViewController.swift
//  contentMode
//
//  Created by 은영김 on 2019/11/22.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var onoffCheck: UISwitch!
    
    @IBOutlet weak var onOff: UILabel!
    
    @IBOutlet weak var a123: UISegmentedControl!
    
    @IBAction func switchButton(_ sender: Any) {
        if onoffCheck.isOn {
            onOff.text = "ON"
            onOff.textColor = .systemPink
            onOff.textAlignment = .left
        }else{
            onOff.text = "OFF"
            onOff.textColor = .systemBlue
            onOff.textAlignment = .right
        
    }
    }
    
    @IBAction func firstSecondThidr(_ sender: Any) {
        switch a123.selectedSegmentIndex {
        case 0:
            onOff.text = "하나"
            onOff.textAlignment = .center
            onOff.textColor = .systemYellow
        case 1:
            onOff.text = "두울"
            onOff.textAlignment = .center
            onOff.textColor = .gray
        case 2:
            onOff.text = "세엣"
            onOff.textAlignment = .center
            onOff.textColor = .green
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
