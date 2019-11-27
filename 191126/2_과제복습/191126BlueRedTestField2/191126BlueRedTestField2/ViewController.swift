//
//  ViewController.swift
//  191126BlueRedTestField2
//
//  Created by 은영김 on 2019/11/26.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "ㅎㅎㅎㅎㅎㅎ"
             
    }

    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func textdsfaweBegin(_ sender: UITextField) {
        print("textBegin")
        print(sender.tag)
        if sender.tag == 0 {
            textLabel.textColor = .systemPink
            textLabel.font = UIFont.systemFont(ofSize: 40)
        } else if sender.tag == 2 {
            textLabel.textColor = .systemGray
            textLabel.font = UIFont.systemFont(ofSize: 40)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        print(sender.text ?? "")
        textLabel.text = sender.text

    }
    
    @IBAction func textDidEndOnExit(_ sender: Any) {
        print("textDidEndOnExit")
    }
    
    @IBAction func textDidEnd(_ sender: Any) {
        print("textDidEnd")
        textLabel.textColor = .systemGreen
        textLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    @IBAction func text2Begin(_ sender: Any) {
        textLabel.textColor = .systemGray
        textLabel.font = UIFont.systemFont(ofSize: 40)
        
    }
    
    @IBAction func text2Changed(_ sender: UITextField) {
        textLabel.text = sender.text
        textLabel.textColor = .systemPurple
    }
    
    @IBAction func text2DidEnd(_ sender: UITextField) {
        
    }
      
}

