//
//  ViewController.swift
//  191126UITestFieldExample
//
//  Created by 은영김 on 2019/11/26.
//  Copyright © 2019 eunyuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextField.font = UIFont.systemFont(ofSize: 30)
        idTextField.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        idTextField.font = UIFont.boldSystemFont(ofSize: 30)
        idTextField.font = UIFont.preferredFont(forTextStyle: .caption1)
//        idTextField.borderStyle = .none
        idTextField.textAlignment = .center
        idTextField.keyboardType = .URL
        // 슬래시랑, 닷컴생김 키보드타입!
        
        
//        idTextField.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        

    }//이벤트를 발생시킨객체에대한 정보를 샌더를 통해 전달
    @IBAction func textFieldDidBegin(_ sender: UITextField) {

        print("키보드 띄우고")
        if sender.tag == 0 {
            print("idTextField")
        } else if sender.tag == 1 {
            print("passwordTextFiedl")
        } else {
            print("confirmPassword")
        }      // 키보드띄우고
    }
    
//타입캐스팅사용, 어떤타입인지 확인후에 맞으면 if문으로
    // 타입이 애니일때 주로이용 ?
//    if let tf = sender as? UITextField {
//
//    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text ?? "")
    // 입력시마다 호출
        
        if sender.text!.count > 6 {
            sender.resignFirstResponder()
        }
        //        원할때 키보드가 내려가도록 할수있음
        
//        view.endEditing(true)
//다루고있는 텍스트필드가뭔지모르는데 그냥내리고싶을때 뷰에있는 모든 애들한테 키보드 내리도록 명령/입력하자마자 내려감
    }
    
    @IBAction func textFieldDidEnd(_ sender: Any) {
        print("textFieldEditingDidEnd")
    }

    
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        print("텍스트필드 종료하고")
    }
    //텍스트필드를 종료.
    
    @IBAction func textFieldPassword(_ sender: Any) {
        print("패스워드Begin")
    }
    // 비번입력
    
    @IBAction func passwordOnExit(_ sender: Any) {
        print("패스워드Exit")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    idTextField.becomeFirstResponder()
        // 바로 키보드 뜨게끔..

}
}
