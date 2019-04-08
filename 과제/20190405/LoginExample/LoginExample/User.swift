import Foundation

class User {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

let users: [User] = [
    User(email: "Mike", password: "abcd"),
    User(email: "Allen", password: "1122"),
    User(email: "Kevin", password: "1234"),
    User(email: "Joke", password: "4321"),
    User(email: "Hillary", password: "aaaa"),
    User(email: "Jenny", password: "dcba"),
]
