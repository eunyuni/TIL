//
//  ViewController.swift
//  191203StorybordSegueExample
//
//  Created by 은영김 on 2019/12/03.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class FirstController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
//prepare 화면전환과정에서 뭔가의 작업을 할수있게 해주는 메소드


    var count1 = 0
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
         segue.destination  //목적지 SecondVC
        segue.source       //출발지 FirstVC
        segue.identifier   //Card, FullScreen
        
        guard let secondVC = segue.destination as?  SeecondViewController else {
            return
        }
        if segue.identifier == "Card" {
            count1 += 1
            secondVC.count = count1
        } else if segue.identifier == "PlusFive" {
            count1 += 5
            secondVC.count = count1
        } else {
            count1 += 10
            secondVC.count = count1
        }
    
    }
    
    @IBAction private func didTapFiveButton(_ sender: Any) {
        performSegue(withIdentifier: "PlusFive", sender: sender)
    }
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
//        let plus = identifier == "Card" ? 1 : 10
//        return count + plus <= 40
        
        
        if identifier == "Card" && count1 + 1 < 40 {
            print("Card")
            return true
        }else if  identifier == "Full" && count1 + 10 < 40{
            print("Full")
            return true
        } else {
            return false
        }
    }
    
    
    
    
    
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        guard let secondVC = unwindSegue.source as? SeecondViewController else { return }
//        count1 = count1 - Int(secondVC.text)!
        self.count1 -= secondVC.minus
    }

}




