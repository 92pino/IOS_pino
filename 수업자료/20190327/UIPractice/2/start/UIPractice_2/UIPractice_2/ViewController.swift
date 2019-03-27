import UIKit

class ViewController: UIViewController {
    
    private let topView: UIView = UIView()
    private let topLeftView: UIView = UIView()
    private let topRightView01: UIView = UIView()
    private let topRightView02: UIView = UIView()
    private let containerView: UIView = UIView()
    private let redView: UIView = UIView()
    private let greenView: UIView = UIView()
    private let blueView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    private func configureLayout() {
        
        // Configure UI
        let innerPadding: CGFloat = 5
        let outerPadding: CGFloat = 10
        
        // TopView
        let topViewWidth = self.view.frame.width - (outerPadding * 2)
        topView.frame = CGRect(x: 10, y: 10, width: topViewWidth, height: 100)
        topView.backgroundColor = .gray
        
        view.addSubview(topView)
        
        let topLeftViewHeight = topView.frame.height - (innerPadding * 2)
        topLeftView.frame = CGRect(x: innerPadding, y: innerPadding, width: 100, height: topLeftViewHeight)
        topLeftView.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0.7321008134, alpha: 1)
        
        topView.addSubview(topLeftView)
        
        let topRightViewWidth = topViewWidth - 100 - (innerPadding * 3)
        let topRightViewHeight = (topView.frame.height - (innerPadding * 3)) / 2
        topRightView01.frame = CGRect(x: (innerPadding * 2 + 100), y: innerPadding, width: topRightViewWidth, height: topRightViewHeight)
        topRightView02.frame = CGRect(x: (innerPadding * 2 + 100), y: (innerPadding * 2 + topRightViewHeight), width: topRightViewWidth, height: topRightViewHeight)
        topRightView01.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        topRightView02.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        topView.addSubview(topRightView01)
        topView.addSubview(topRightView02)
        
        // ContainerView
        containerView.backgroundColor = .orange
        let containerViewWidth = self.view.frame.width - (outerPadding * 2)
        let containerViewHeight = self.view.frame.height - (outerPadding * 3) - 100
        containerView.frame = CGRect(x: 10, y: (outerPadding * 2) + topView.frame.height, width: containerViewWidth, height: containerViewHeight)
        self.view.addSubview(containerView)
        
        let width = containerViewWidth - (innerPadding * 2)
        let height = (containerViewHeight - (innerPadding * 4)) / 3
        
        // RedView
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 5, y: 5, width: width, height: height)
        containerView.addSubview(redView)
        
        // GreenView
        greenView.backgroundColor = .green
        greenView.frame = CGRect(x: 5, y: 10 + height, width: width, height: height)
        containerView.addSubview(greenView)
        
        // BlueView
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 5, y: 15 + (height * 2), width: width, height: height)
        containerView.addSubview(blueView)
    }
}

