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


//BST methods
extension Node {
    
    func find(symbol: T)  -> Node? {
        
        if self.symbol == symbol {
            
            return self
        }
        
        if symbol < self.symbol {
            
            return left?.find(symbol)
            
        }else {
            
            return right?.find(symbol)
        }
    }
    
    func insert(symbol: T) {
        
        if symbol < self.symbol {
            
            if left == nil {
               
                left = Node(symbol: symbol)
            
            } else {
            
                left?.insert(symbol)
            }
            
        } else {
            
            if right == nil {
            
                right = Node(symbol: symbol)
            
            } else {
            
                right?.insert(symbol)
            }
        }
    }
}

//Printing
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

a.find("a")
a.find("z")

let b = Node(symbol: "b")
let c = Node(symbol: "c")
let d = Node(symbol: "d")
let e = Node(symbol: "e")
let f = Node(symbol: "f")
let g = Node(symbol: "g")



//d.left = b
//
//b.left = a
//b.right = c
//
//d.right = f
//
//f.left = e
//f.right = g

d.insert("b")
d.insert("a")
d.insert("c")
d.insert("f")
d.insert("e")
d.insert("g")

d.printPreorder()
print("d tree preOrder ^^^")
d.printPostorder()
print("d tree postOrder ^^^")
d.printInorder()
print("d tree inOrder ^^^")


let x = Node(symbol: 1)


d.find("e")


/*

Binary Tree: Tree with max 2 child nodes per node
Binary Search Tree: Binary tree where every thing the to left is less than the root node or it's parent, everything to the right is greater than the root node or it's parent.

Trees are graphs, but graphs are not trees.
Trees are a subset of graphs.
Trees are graphs that do not have more than one way to get back to the root node.

*/