//: [Previous](@previous)

class User {
  static let shared = User()    // 힙에 생성
//  private init() {}
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends {
  let name: String
}

struct FriendList {
  mutating func addFriend(name: String) {
    // func이 끝나면 user인스턴스는 삭제
    // 첫번째 user.shared.firends는 빈값
//    let user = User()
//    let friend = Friends(name: name)
//    user.friends.append(friend)
    // "원빈", "장동건", "정우성" 3명을 친구로 추가했을 때
    // 최종적으로 user.friends 에 들어있는 friend 의 숫자는?
    
    // user라는 변수는 함수가 끝나면 사라지지만 User.shared는 User()라는 인스턴스에 남아있다.
    // User.shared는 힙 영역에 남아있다.
    
    // User.shared 힙에 할당
    let user = User.shared
    let friend = Friends(name: name)
    user.friends.append(friend)
  }
}

// 스택영역
struct BlockList {
  mutating func blockFriend(name: String) {
    let friend = Friends(name: name)
    // $0 == friends
    if let index = User.shared.friends.firstIndex(where: { $0.name == friend.name }) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(where: { $0.name == friend.name }) {
      User.shared.blocks.append(friend)
    }
  }
}

var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
User.shared.friends


var blockList = BlockList()
blockList.blockFriend(name: "원빈")
User.shared.friends
User.shared.blocks

let userInit = User()
userInit.friends
userInit.blocks

let userShared = User.shared
userShared.friends
userShared.blocks



//: [Next](@next)
