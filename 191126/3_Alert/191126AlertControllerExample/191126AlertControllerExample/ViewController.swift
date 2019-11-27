//
//  ViewController.swift
//  191126AlertControllerExample
//
//  Created by 은영김 on 2019/11/26.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }

    @IBAction private func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .actionSheet
            //actionSheet -> 위아래로 / alert->중앙에서 창이뜸
            //preferredStyle->UIAlertController 스타일결정
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in print("OK버튼") }
        alertController.addAction(okAction)
            //{ (action) in print("OK버튼") } -> nil로 기본값 들어가기때문에 생략가능
        
        let cencelAction = UIAlertAction(title: "Cencel", style: .cancel) { _ in print("cancel") }
        alertController.addAction(cencelAction)
        // 캔슬액션/ 스타일에 캔슬주면 액션이 입혀짐(캔슬액션은 별도취급)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive)
        alertController.addAction(DeleteAction)
        //destructive -> 유저에게 주의를 주기위한 동작으로 빨강으로표현됨 (캔슬처럼 별도취급은아님)
        
    
        present(alertController, animated: true)
        //  타이틀 메세지를 띄운다
    }
}

