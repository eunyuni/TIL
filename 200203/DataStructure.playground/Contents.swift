import UIKit

var str = "Hello, playground"


protocol LinkedListStack {
  var size: Int { get }     // 전체 개수
  var isEmpty: Bool { get } // 노드가 있는지 여부
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
}

final class Node {
  var value: String?
  var next: Node?
  
  init(value: String) {
    self.value = value
  }
}

// head -> "A"
// head = "A" -> "B"
final class SingleLinkedList: LinkedListStack {
  private var head: Node = Node(value: "")
  var isEmpty: Bool { return head.next == nil }   // head -> nil
  var size = 0 {
    didSet { size = size < 0 ? 0 : size }
  }
  
  private var lastNode: Node? {
    guard var node = head.next else { return nil }  // head.next가 값이 하나라도있으면 node로 들어감
    while let nextNode = node.next {  // node.next에 값이없으면 종료. 있으면 nextNode에 들어감
      node = nextNode
    }
    return node
  }
  
  func push(node newNode: Node) {
    self.size += 1
//    self.lastNode?.next = node
    guard let node = lastNode else { return head.next = newNode }
    node.next = newNode
  }

  
  func peek() -> String? {
    guard let node = lastNode else { return nil }
    return node.value
//    return lastNode?.value
  }
  
  
  func pop() -> String? {
    self.size -= 1
    guard var node = head.next else { return nil }
    while let nextNode = node.next {
      guard nextNode.next != nil else {
        node.next = nil
        return nextNode.value
      }
      node = nextNode
    }
    head.next = nil
    return node.value    
  }
    
}

let singleLinked = SingleLinkedList()
singleLinked.isEmpty
singleLinked.push(node: Node(value: "A"))
singleLinked.push(node: Node(value: "B"))
singleLinked.pop()
singleLinked.isEmpty

singleLinked.push(node: Node(value: "C"))
singleLinked.size
singleLinked.pop()
singleLinked.peek()


let temp2 = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
print(temp2.map{Int($0)}.compactMap{$0}.map{$0 * $0}.reduce(0){ $0 + $1 })
