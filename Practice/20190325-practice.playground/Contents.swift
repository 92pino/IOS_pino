import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {
    override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let topView: UIView = UIView()
        
        topView.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: 100)
        topView.backgroundColor = .blue
        
        // ViewController에 topView라는 view를 추가하는것
        view.addSubview(topView)
        
        let bottomView = UIView()
        bottomView.frame = CGRect(origin: CGPoint(x: 15, y:668 - 115), size: topView.frame.size)
        bottomView.backgroundColor = .red
        view.addSubview(bottomView)
    }
}

PlaygroundPage.current.liveView = MyViewController()
