import UIKit

protocol LinkedListStack {
  var size: Int { get }     // 전체 개수
  var isEmpty: Bool { get } // 노드가 있는지 여부
  var head: Node? { get }   // 링크드 리스트 시작 지점
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
}
class Node {
  let value: String
  var next: Node?
  
  init(value: String) {
    self.value = value
  }
}

class SingleLinkedList: LinkedListStack {
  
  var size: Int = 0
  var isEmpty: Bool { return head == nil }
  
  var head: Node?
  var lastNode: Node? {
    guard var node = head else { return nil }
    while let nextNode = node.next {
      node = nextNode
    }
    return node
  }
  
  func push(node newNode: Node) {
    size += 1
    guard let node = lastNode else { return head = newNode }
    node.next = newNode
  }
  func pop() -> String? {
    size = size > 0 ? size - 1 : 0
    guard var node = head else { return nil }
    guard node.next != nil else {
      head = nil
      return node.value
    }
    
    while let nextNode = node.next {
      guard nextNode.next != nil else {
        node.next = nil
        return nextNode.value
      }
      node = nextNode
    }
    return node.value
  }
  func peek() -> String? {
    guard let node = lastNode else { return nil }
    return node.value
  }
  
}

let linkedList = SingleLinkedList()
linkedList.isEmpty

linkedList.push(node: Node(value: "A"))
linkedList.push(node: Node(value: "B"))
print(linkedList.size)
linkedList.peek()
linkedList.size

linkedList.isEmpty
linkedList.pop()
linkedList.push(node: Node(value: "C"))
linkedList.size

linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.size
linkedList.isEmpty
