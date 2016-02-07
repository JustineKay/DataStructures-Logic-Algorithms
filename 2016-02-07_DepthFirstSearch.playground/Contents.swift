//: Playground - noun: a place where people can play

import UIKit

import Foundation

indirect enum Tree {
    case Node(Int, left: Tree, right: Tree)
    case Empty
}

func printTree(tree: Tree, label: String = "t") -> String {
    switch(tree) {
    case let .Node(x, left, right):
        var ret = ""
        switch (left) {
        case .Node: ret += "\(label) -> \(label)l\n"
        case .Empty: ret += "\(label) -> \(label)L\n\(label)L[shape=point]\n"
        }
        switch (right) {
        case .Node: ret += "\(label) -> \(label)r\n"
        case .Empty: ret += "\(label) -> \(label)R\n\(label)R[shape=point]\n"
        }
        ret += "\(label)[label=\"\(x)\"]\n"
        return ret + printTree(left, label: label + "l") +
            printTree(right, label: label + "r")
    case .Empty:
        return ""
    }
}

func generateTree(depth: UInt32 = 10) -> Tree {
    if (arc4random_uniform(depth) == 0) {
        return Tree.Empty
    } else {
        return Tree.Node(Int(arc4random_uniform(100)),
            left: generateTree(depth - 1),
            right: generateTree(depth - 1))
    }
}

// To show the tree, uncomment this and copy and paste the output into
// http://www.webgraphviz.com/ (or your local GraphViz installation)
//print("digraph g {\n" + printTree(tree) + "}")


func dfs(tree: Tree, needle: Int) -> Bool {
    
    switch (tree) {
        
    case let .Node(value, left: left, right: right):
        if value == needle {
            
            return true
        
        }else {
            
            
            return dfs(left, needle: needle) || dfs(right, needle: needle)
        }
        
    case .Empty:
        
        return false
    }
}

let tree = generateTree(9)

//print("digraph g {\n" + printTree(tree) + "}")

dfs(tree, needle: 28)



//**************ASSESSMENT REVIEW NOTES********************


//Calculating Space complexity
//Look at any time you allocate memory
//When you copy (when you use var)

//SPACE: O(1)
func sumO1(xs: [Int]) -> Int {
    
    var ret = 0
    
    for x in xs {
        
        ret += x
    }
    
    return ret
}

//SPACE: O(n)
func sum_On(xs: [Int]) -> Int {
    
    var ret = 0
    var ys = xs

    for x in xs {
        
        ret += x
    }
    
    return ret
}

//SPACE: O(n^2)
func sum_On2(xs: [Int]) -> Int {
    
    var ret = 0
    
    for x in xs {
        
        var ys = xs
        ret += x
    }
    
    return ret
}


//Stacks

var intStack = [Int]()
//push
intStack.append(100)
//pop
intStack.popLast()
//peek
intStack.append(200)
intStack.last

//Queues
var intQueue = [Int]()
//enqueue
intQueue.append(100)
//dequeue
intQueue.removeFirst()


//Arrays
//Built in

//Lists


//Sets
//Built in

//Hashmaps
//Just Dictionaries


//Trees

//Graphs
//adjacency lists, adjacency matrix

//**************QUICK SORT REVIEW********************

func partition(xs: [Int], pivot: Int) -> ([Int], [Int]) {
    
    return (xs.filter{$0 < pivot}, xs.filter{$0 > pivot})
}

func qSort(xs: [Int]) -> [Int] {
    
    if xs.isEmpty {
        
        return []
    }
    
    let pivot = xs[0]
    let(ys, zs) = partition(xs, pivot: pivot)
    return qSort(ys) + [pivot] + qSort(zs)
}

qSort([8,6,7,5,3,0,9])