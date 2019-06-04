//: [Previous](@previous)
import Foundation


/***************************************************
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 "http://api.open-notify.org/iss-now.json"
 ***************************************************/

func practice1() {
    let p1 = "http://api.open-notify.org/iss-now.json"  // 우주비행사 정보
    let apiURL = URL(string: p1)!
    
    URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
        200..<400 ~= response.statusCode
            else { return print("StatusCode is not valid")}
        
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            else { return print("No Data") }
        
        guard (jsonObject["message"] as? String) == "success",
            let timeStamp = jsonObject["timestamp"] as? Int,
            let position = jsonObject["iss_position"] as? [String: String]
        else { return print("Parsing Error") }
        print(timeStamp)
        print(position)
    }.resume()
}
practice1()

/***************************************************
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 ***************************************************/

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
}
]
}
"""

struct User {
    let id: Int
    let firstName, lastName, email: String
}

var users = [User]()

func practice2() {
//    guard JSONSerialization.isValidJSONObject(jsonString2) else { return }
    let jsonData = jsonString2.data(using: .utf8)!
    let first = try! JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
    let last = first["users"] as! [[String: Any]]
    
    for i in last {
        let id = i["id"] as? Int
        let firstName = i["first_name"] as? String
        let lastName = i["last_name"] as? String
        let email = i["email"] as? String
        users.append(User(id: id!, firstName: firstName!, lastName: lastName!, email: email!))
    }
    users.forEach { print($0) }
}
//practice2()



/***************************************************
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 ***************************************************/

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

var posts = [Post]()

func practice3() {
    // json 데이터 파싱
    let jsonData = "https://jsonplaceholder.typicode.com/posts"
    let apiURL = URL(string: jsonData)!
    
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            200..<400 ~= response.statusCode else {return print("StatusCode is not valid")}
        guard let data = data,
        let jsonObject = try?
            JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { return print("No Data") }
        
        for i in jsonObject {
            var userId = i["userId"] as! Int
            var id = i["id"] as! Int
            var title = i["title"] as! String
            var body = i["body"] as! String
            posts.append(Post(userId: userId, id: id, title: title, body: body))
        }
        posts.forEach { print($0) }
        print(jsonObject.count)
    }.resume()
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


