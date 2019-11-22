//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        let blueNemo = nemo1()
        let grayNemo = nemo2(abb: blueNemo)
        let pinkNemo = nemo3(abc: grayNemo)
    }
    
    func nemo1() -> UIView {
        let blueNemo = UIView()
        blueNemo.frame = CGRect(x: 30, y: 30, width: 315, height: 605)
        blueNemo.backgroundColor = .systemBlue
        view.addSubview(blueNemo)
        return blueNemo
    }
    
    func nemo2(abb: UIView) -> UIView {
        let grayNemo = UIView()
        grayNemo.frame = CGRect(x: 30, y: 30, width: 255, height: 545)
        grayNemo.backgroundColor = .systemGray3
        abb.addSubview(grayNemo)
        return grayNemo
    }
    
    func nemo3(abc: UIView) -> UIView {
        let pinkNemo = UIView()
        pinkNemo.frame = CGRect(x: 30, y: 30, width: 195, height: 485)
        pinkNemo.backgroundColor = .systemPink
        abc.addSubview(pinkNemo)
        return pinkNemo
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
