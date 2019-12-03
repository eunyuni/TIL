//
//  SeecondViewController.swift
//  191203StorybordSegueExample
//
//  Created by 은영김 on 2019/12/03.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class SeecondViewController: UIViewController {

    @IBOutlet weak var TextLabel: UITextField!
    
    @IBOutlet weak var lavel: UILabel!
    
    var count = 0
    var text = ""
    var minus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lavel.text = String(count)

    }

    @IBAction func unwindToSecondVC(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

    @IBAction func TextLabelAction(_ sender: UITextField) {
    }
    @IBAction func didTapChanged(_ sender: UITextField) {
        guard let number = Int(sender.text ?? "0") else { return }
        minus = number
//        print(sender.text)
//        text = sender.text!
//       let firstVC = FirstController()
//        firstVC.count1 = sender.text!
    }
    
}

