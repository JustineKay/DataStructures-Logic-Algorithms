//: Playground - noun: a place where people can play

import UIKit


//********Classes Vs. Structs***********

class SomeClass {
    var val:Int
    init(val: Int) {
        self.val = val
    }
}

struct SomeStruct {
    var val: Int
}

var s = SomeStruct(val: 5)
var cl = SomeClass(val: 5)

var scopy = s
var cRef = cl

scopy.val = 1
cRef.val = 1

print(s.val)
print(cl.val)



//**********GRAPHS*************

struct Vertex {
    
    var symbol = String()
    
}

struct Edge {
    
    let pairOfVertices: (Vertex, Vertex)
    let weight = Int()
    
}

struct Graph {
    
    var vertices = [Vertex]()
    var edges = [Edge]()
    
}


var a = Vertex()
a.symbol = "a"

var b = Vertex()
b.symbol = "b"

var c = Vertex()
c.symbol = "c"

var d = Vertex()
d.symbol = "d"

var e = Vertex()
e.symbol = "e"

var edgeAB = Edge(pairOfVertices: (a,b))
var edgeAD = Edge(pairOfVertices: (a,d))
var edgeAE = Edge(pairOfVertices: (a,e))
var edgeEC = Edge(pairOfVertices: (e,c))
var edgeCD = Edge(pairOfVertices: (c,d))

var graph1 = Graph()
graph1.vertices = [a,b,c,b,e]
graph1.edges = [edgeAB, edgeAD, edgeAE, edgeEC, edgeCD]


