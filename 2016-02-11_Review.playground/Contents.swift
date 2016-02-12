//: Playground - noun: a place where people can play

import UIKit


//********BINARY TREE**********
class Node<T: Comparable> {
    
    let value: T
    var left: Node<T>?
    var right: Node<T>?
    init(value: T) {
        
        self.value = value
    }
}

// extensions are a way to add func to any class

extension Node {
    
    func preorderDFS(value: T) -> Node? {
        if self.value == value {
            
            return self
        }
        
        for child in [left, right] {
            
            if let result = child?.preorderDFS(value) {
                
                return result
            }
        }
        
        return nil
    }
    
    func bfs(value: T) -> Node? {
        
        //check the current node (self)'s value
        if self.value == value {
            //if it matches, return self
            return self
        }
        
        //check this node's child nodes
        for child in [left, right] {
            
            //print to view traversal
            if child != nil {
                print("Visited: \(child!)")
            }
            
            if child?.value == value {
                
                return child
            }
        }
        
        //repeat process for each of the child nodes
        for child in [left, right] {
            
            if let result = child?.bfs(value) {
                
                return result
            }
        }
        
        return nil
    }
    
    func printInorder() {
    
        left?.printInorder()
        print(value)
        right?.printInorder()
    
    }
    
    
    //declare a local variable
    //to represent the value at left
    //a safer way to "unwrap" an optional
    func printInorderLocalVariable() {
        
        if let l = left {
            
            l.printInorder()
        }
        
        print(value)
        
        if let r = right {
            
            r.printInorder()
        }
        
    }
    
    //root node is printed first
    func printPreorder() {
        
        print(value)
        left?.printPreorder()
        right?.printPreorder()
    }
    
    //root node is printed last
    func printPostorder() {
        
        left?.printPostorder()
        right?.printPostorder()
        print(value)
    }
    
}

extension Node: CustomStringConvertible {
    
    var description: String {
        
        return "\(value)"
    }
}


let a = Node(value: 1)
let b = Node(value: 2)
let c = Node(value: 3)
let d = Node(value: 4)
let e = Node(value: 5)
let f = Node(value: 6)
let g = Node(value: 7)

d.left = b
b.left = a
b.right = c
d.right = f
f.left = e
f.right = g

/*
      4
    2   6
   1 3 5 7
*/

d.bfs(5)
d.printInorder()

/*

Call stack for printInorder

4.printInorder()
 2.printInorder()
  1.printInorder()
   (left is nil)
   print 1
  (right is nil)
  print 2
 3.printInorder()
  (left is nil)
  print 3
  (right is nil)
print 4
 6.printInorder()
  5.printInorder()
  (left is nil)
  print 5
  (right is nil)
 print 6
  7.printInorder()
  (left is nil)
  print 7
  (right is nil)
*/

//*******GRAPH********

class GraphNode<T: Comparable> {
    
    let value: T
    var connectedNodes: [Node<T>] = []
    init(value: T) {
        
        self.value = value
    }
}



//*********Insertion Sort**********

func insertionSort<T: Comparable>(inout values: [T]){
    
    for i in 0..<values.count {
        
        var j = i
        
        while j > 0 && values[j-1] > values[j] {
        
            if values[j] < values[j-1] {
                
                swap(&values[j], &values[j-1])
                
            }
            
            j -= 1
        }
    }
}

var values = [4, 2, 5, 2, 1]
insertionSort(&values)