//: Playground - noun: a place where people can play

import UIKit

class Node<T: Comparable> {
    
    var left: Node?
    var right: Node?
    let symbol: T
    
    init(symbol: T) {
        
        self.symbol = symbol
    }
}

extension Node {
    
    func printInorder() {
        left?.printInorder()
        print(self)
        right?.printInorder()
        
    }
    
    func printPreorder() {
        
        print(self)
        left?.printPreorder()
        right?.printPreorder()
    }
    
    func printPostorder() {
        
        left?.printPostorder()
        right?.printPostorder()
        print(self)
        
    }
}


extension Node: CustomStringConvertible {
    
    var description: String {
        
        return "{\(symbol)}"
    }
}

var root = Node(symbol: "root")

var l = Node(symbol: "left")

var r = Node(symbol: "right")

root.left = l
root.right = r

root.left?.left

root.printPreorder()
root.printPostorder()

/*

             d
          /     \
         b       f
       /  \     /  \
      a    c   e    g

*/
let a = Node(symbol: "a")
let b = Node(symbol: "b")
let c = Node(symbol: "c")
let d = Node(symbol: "d")
let e = Node(symbol: "e")
let f = Node(symbol: "f")
let g = Node(symbol: "g")

d.left = b

b.left = a
b.right = c

d.right = f

f.left = e
f.right = g


d.printPostorder()
print("d tree postOrder^^^")
d.printInorder()
print("d tree in order ^^^")


let x = Node(symbol: 1)