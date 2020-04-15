//
//  ViewController.swift
//  191206UserDefaultBasic
//
//  Created by 은영김 on 2019/12/06.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageText: String = ""
    var imageCat = UIImage.init(named: "cat.jpg")
    var imageDog = UIImage.init(named: "dog.jpg")
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var `switch1`: UISwitch!
    
//    UserDefaults.standard.set(TestSwitch.isOn, forKey: "switchState")

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.bool(forKey: "switch")
        print(userDefaults)
        animalLabel.text = "🥺"
        imageView.image = UIImage.init(named: "cat")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    @IBAction func switchButton(_ sender: UISwitch) {
        if switch1.isOn {
            animalLabel.text = "야옹"
            self.imageText = "cat"
            imageView.image = UIImage.init(named: imageText)
          //  self.userDefaults.set(String(), forKey: "야옹이")
        } else {
            animalLabel.text = "멍멍!"
            self.imageText = "dog"
            imageView.image = UIImage.init(named: imageText)
//            self.userDefaults.set(String, forKey: "멍뭉이")
        }
        
        userDefaults.set(switch1.isOn, forKey: "switch")
    
    }
}

