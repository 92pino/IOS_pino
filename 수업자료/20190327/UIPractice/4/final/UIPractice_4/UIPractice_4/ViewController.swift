import UIKit

class ViewController: UIViewController {
    
    
    
    var keyboardShown:Bool = false
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        corner(to: loginButton, with: 10)
        print(users[0].name)
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let id = idTextField.text, !id.isEmpty else {
            alert(title: "아이디가 누락되었습니다.", message: "아이디를 입력해주세요.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(title: "비밀번호가 누락되었습니다.", message: "비밀번호를 입력해주세요.")
            return
        }
//        print(userData)
//        for data in userData {
//            if user.name == id && user.password == password {
//                // Login Sucess
//                // present SecondViewController
//                print("success")
//
//                let secondViewController = SecondViewController()
//                secondViewController.currentUser = user
//                present(secondViewController, animated: true, completion: nil)
//                return
//            }
//        }
        
        alert(title: "아이디 또는 비밀번호가 일치하지 않습니다.", message: "다시 입력해주세요.")
        
    }
    
    func alert(title: String, message: String) {
        let alertContrller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertContrller.addAction(okAction)
        present(alertContrller, animated: true, completion: nil)
    }
    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

