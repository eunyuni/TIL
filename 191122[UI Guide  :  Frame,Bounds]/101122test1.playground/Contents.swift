//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white
        self.view = view
    }
    override func viewDidLoad() {
        let blueNemo1 = nemo1()
//        let blueNemo2 = nemo2()

    }
    
    func nemo1() -> UIView {
        let blueNemo1 = UIView()
        blueNemo1.frame = CGRect(x: 15, y: 15, width: view.frame.size.width - 30, height: 100)
        blueNemo1.backgroundColor = .systemBlue
        
        view.addSubview(blueNemo1)
        return blueNemo1
    }

//    func nemo2() -> UIView {
//        let blueNemo2 = UIView()
//        blueNemo2.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
//        blueNemo2.backgroundColor = .systemPink
//        view.addSubview(blueNemo2)
////        view.frame.size.width = 30
//        return blueNemo2
//    }
//
}
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 667)
PlaygroundPage.current.liveView = vc
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

