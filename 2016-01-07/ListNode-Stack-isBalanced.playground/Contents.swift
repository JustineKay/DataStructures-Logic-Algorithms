//: Playground - noun: a place where people can play

import UIKit

class ListNode {
    
    var value: Int?
    var next: ListNode?
    
    init(value: Int, next : ListNode?) {
        
        self.value = value
        self.next = next
    }
    
    func removeHead() -> ListNode? {
        
        let next = self.next
        self.next = nil
        return next
    }
}

var head = ListNode(value: 5, next: ListNode(value: 6, next: ListNode(value: 7, next: nil)))

head.value
head.next?.value
head.next?.next?.value


let v = head.value
head = head.removeHead()!

head.value


struct Stack<Element> {
    
    var array: [Element] = []
    
    var isEmpty: Bool {
        
        return array.isEmpty
    }
    
    func peek() -> Element? {
    
    return array.last
    }

    
    mutating func push(element: Element) {
        
        array.append(element)
    }
    mutating func pop() -> Element {
        
        return array.removeLast()
    }
}

var s = Stack<String>()
s.push("hello")
s.push("there")

s.pop()


func isBalanced(parens: String) -> Bool {
    
    var s = Stack<Character>()
    
    for c in parens.characters {
        
        if c == "(" {
            
           s.push(c)
            
        }else if c == ")" {
            
            if s.peek() == nil {
                return false
            }
            
            s.pop()
        }
    }
    
    return (s.peek() == nil) //s.isEmpty
}

isBalanced("()(((()))(()()))))((")
isBalanced("((((((((()))))))))")


func hash(key: String) -> Int {
    
    return key.characters.count - 1
}

hash("aa")
hash("bc")

"aa".hash
"bc".hash

let graph: Dictionary< Int, [Int]> = [
    
    0 : [4],
    1 : [3, 4],
    2 : [0,1, 3],
    3 : [4],
    4 : []
]

let start = 2
let connectedNodes = graph[start]

let next = connectedNodes![0]

let nextConnectedNodes = graph[next]

//start.next...

