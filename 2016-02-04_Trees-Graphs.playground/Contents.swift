//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    var left: Node?
    var right: Node?
    let symbol: String
    
    init(symbol: String) {
        
        self.symbol = symbol
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

