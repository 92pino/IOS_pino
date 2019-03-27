import UIKit

class ViewController: UIViewController {
    
    let priceLabel = UILabel()
    
    let sec01 = UIView()
    let sec01_1 = UIImageView()
    let sec01_2 = UILabel()
    let sec01_3 = UILabel()
    let sec01_4 = UIButton(type: .system)
    
    let sec02 = UIView()
    let sec02_1 = UIImageView()
    let sec02_2 = UILabel()
    let sec02_3 = UILabel()
    let sec02_4 = UIButton(type: .system)
    
    let sec03 = UIView()
    let sec03_1 = UIImageView()
    let sec03_2 = UILabel()
    let sec03_3 = UILabel()
    let sec03_4 = UIButton(type: .system)
    
    let sec04 = UIView()
    let sec04_1 = UIImageView()
    let sec04_2 = UILabel()
    let sec04_3 = UILabel()
    let sec04_4 = UIButton(type: .system)
    
    let beverages: [Beverage] = [
        Beverage(name: "코카콜라", imageName: "coke", price: 1500),
        Beverage(name: "쥬스", imageName: "juice", price: 1200),
        Beverage(name: "립톤", imageName: "lipton", price: 1700),
        Beverage(name: "펩시", imageName: "pepsi", price: 1300)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: 700, width: 200, height: 50)
        priceLabel.text = "0"
        priceLabel.backgroundColor = .yellow
        priceLabel.textAlignment = .center
        
        let beverage1 = beverages[0]
        sec01.frame = CGRect(x: 10, y: 50, width: 150, height: 300)
        sec01.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        sec01_1.frame = CGRect(x: 10, y: 10, width: sec01.frame.width - 20, height: 100)
        sec01_1.image = UIImage(named: beverage1.imageName)
        sec01_2.text = beverages[0].name
        sec01_2.frame = CGRect(x: 10, y: sec01_1.frame.height + 10 + 10, width: 100, height: 10)
        sec01_2.textAlignment = .center
        sec01_3.text = String(beverages[0].price)
        sec01_3.frame = CGRect(x: 10, y: sec01_1.frame.height + 10 + 50, width: 100, height: 30)
        sec01_3.textAlignment = .center
        
        
        
        view.addSubview(priceLabel)
        view.addSubview(sec01)
        view.addSubview(sec02)
        view.addSubview(sec03)
        view.addSubview(sec04)
        
        sec01.addSubview(sec01_1)
        sec01.addSubview(sec01_2)
        sec01.addSubview(sec01_3)
        sec01.addSubview(sec01_4)
        
        configureAttribute()
    }
    
    
    
    func configureAttribute() {
        
    }
    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

