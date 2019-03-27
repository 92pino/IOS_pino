import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    
    
    let users: [User] = [
        User(name: "Mike", profileImageName: "person1", password: "abcd"),
        User(name: "Allen", profileImageName: "person2", password: "1122"),
        User(name: "Kevin", profileImageName: "person3", password: "1234"),
        User(name: "Joke", profileImageName: "person4", password: "4321"),
        User(name: "Hillary", profileImageName: "person5", password: "aaaa"),
        User(name: "Jenny", profileImageName: "person6", password: "dcba"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let id = idTextField.text, !id.isEmpty else {
            // 오류처리
            // 사용자에게 아이디가 없습니다라는 경고창 띄우기
            // 함수 종료
            
            alert(title: "아이디가 틀렸습니다.", message: "아이디를 다시 입력해주세요")
            return
        }
        
        guard let pw = pwTextField.text, !pw.isEmpty else {
            // 오류처리
            // 사용자에게 비밀번호가 없습니다라는 경고창 띄우기
            // 함수 종료
            
            alert(title: "비밀번호가 틀렸습니다.", message: "비밀번호를 다시 입력해주세요.")
            return
        }
        
        for user in users {
            if user.name == id && user.password == pw {
                print("Success")
                
                // 다음 뷰 컨트롤러 띄워주기
                let secondVC = SecondViewController()
                secondVC.currentUser = user
                present(secondVC, animated: true)
                
                return
            }
        }
        
        // 사용자에게 아이디 또는 비밀번호가 없습니다라는 경고창 띄우기
        alert(title: "아이디 또는 비밀번호가 없습니다.", message: "입력해주세요.")
    }
    
    @IBAction func maximumPw(_ sender: Any) {
        
    }
    
    func alert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

