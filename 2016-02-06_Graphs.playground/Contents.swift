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

//**As Structs***

struct VertexS {
    
    var symbol = String()
    
}

struct EdgeS {
    
    let pairOfVertices: (VertexS, VertexS)
    let weight = Int()
    
}

struct GraphS {
    
    var vertices = [VertexS]()
    var edges = [EdgeS]()
    
}


var a = VertexS()
a.symbol = "a"

var b = VertexS()
b.symbol = "b"

var c = VertexS()
c.symbol = "c"

var d = VertexS()
d.symbol = "d"

var e = VertexS()
e.symbol = "e"

var edgeAB = EdgeS(pairOfVertices: (a,b))
var edgeAD = EdgeS(pairOfVertices: (a,d))
var edgeAE = EdgeS(pairOfVertices: (a,e))
var edgeEC = EdgeS(pairOfVertices: (e,c))
var edgeCD = EdgeS(pairOfVertices: (c,d))

var graph1 = GraphS()
graph1.vertices = [a,b,c,b,e]
graph1.edges = [edgeAB, edgeAD, edgeAE, edgeEC, edgeCD]



//***As Classes***

enum State {
    
    case Undiscovered
    case Discovered
    case Finished
}

class Vertex {
    var name: String
    var state: State
    var prevVertex: Vertex?
    var currentDistance: Int
    
    init(name: String) {
        self.name = name
        self.state = .Undiscovered
        self.currentDistance = 0
    }
}

class Edge {
    var vertices: (Vertex, Vertex)
    
    init(vertex1: Vertex, vertex2: Vertex) {
        
        self.vertices = (vertex1, vertex2)
    }
    
    func contains(vertex: Vertex) -> Bool {
        
        return vertices.0 == vertex || vertices.1 == vertex
    }
    
    func getVertexPairFor(vertex vertex: Vertex) -> Vertex? {
        
        if vertex == vertices.0 {
            
            return vertices.1
        }
        
        if vertex == vertices.1 {
            
            return vertices.0
        }
        
        return nil
    }
}


func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.name == rhs.name
}


class Graph {
    var vertices: [Vertex]
    var edges: [Edge]
    
    init(vertices: [Vertex], edges: [Edge]) {
        self.vertices = vertices
        self.edges = edges
    }
}


var aA = Vertex(name: "A")
var bB = Vertex(name: "B")
var cC = Vertex(name: "C")
var dD = Vertex(name: "D")
var eE = Vertex(name: "E")

var AB = Edge(vertex1: aA, vertex2: bB)
var AD = Edge(vertex1: aA, vertex2: dD)
var AE = Edge(vertex1: aA, vertex2: eE)
var EC = Edge(vertex1: eE, vertex2: cC)
var CD = Edge(vertex1: cC, vertex2: dD)

var graph2 = Graph(vertices: [aA, bB, cC, dD, eE], edges: [AB, AD, AE, EC, CD])

//BFS
//1. enqueue starting point
//2. mark starting point as discovered
//3. enqueue all adjacent vertices that are undiscovered
//4. mark enqueued vertices as discovered
//5. dequeue and mark as finished
//6. go to next item in queue, if queue is not empty


//*****************PRINT VERTICES***************************

func printAllVertices(graph: Graph, startingVertex: Vertex) {
    
    var vQue = [Vertex]()
    
    vQue.append(startingVertex)
    startingVertex.state = .Discovered
    
    while !vQue.isEmpty {
        
        let v = vQue.removeFirst()
        
        for edge in graph.edges {
            
            if edge.contains(v) {
                
                let edgeV = edge.getVertexPairFor(vertex: v)!
                
                if edgeV.state == .Undiscovered {
                    
                    vQue.append(edgeV)
                    edgeV.state = .Discovered
                }
            }
        }
        
        print(v.name)
        v.state = .Finished
    }
   
}

//printAllVertices(graph2, startingVertex: aA)



//****************SHORTEST DISTANCE**************************

func shortestDistance(graph: Graph, startingV: Vertex, endV: Vertex) {
    
    var vQue = [Vertex]()
    
    vQue.append(startingV)
    startingV.state = .Discovered
    
    while !vQue.isEmpty {
        
        let v = vQue.removeFirst()
        
        if v == endV {
            
            break
        }
        
        for edge in graph.edges {
            
            if edge.contains(v) {
                
                let edgeV = edge.getVertexPairFor(vertex: v)!
                
                if edgeV.state == .Undiscovered {
                    
                    vQue.append(edgeV)
                    edgeV.currentDistance = v.currentDistance + 1
                    edgeV.prevVertex = v
                    edgeV.state = .Discovered
                }
            }
        }
        
        print("\(v.name),\(v.currentDistance)")
        v.state = .Finished
    }
    
    printReversePath(endV)
}

func printReversePath (endV:Vertex) {
    
    var v = endV
    print(v.name)
    
    while v.prevVertex != nil {
        
        print(v.prevVertex?.name)
        v = v.prevVertex!
    }

}

//shortestDistance(graph2, startingV: aA, endV: cC)


//*************SHORTEST DISTANCE WITH RECURSIVE PRINT FUNC FOR PATH*******************

func shortestDistanceRecursivePrint (graph: Graph, startingV: Vertex, endV: Vertex) {
    
    var vQue = [Vertex]()
    
    vQue.append(startingV)
    startingV.state = .Discovered
    
    while !vQue.isEmpty {
        
        let v = vQue.removeFirst()
        
        if v == endV {
            
            break
        }
        
        for edge in graph.edges {
            
            if edge.contains(v) {
                
                let edgeV = edge.getVertexPairFor(vertex: v)!
                
                if edgeV.state == .Undiscovered {
                    
                    vQue.append(edgeV)
                    edgeV.currentDistance = v.currentDistance + 1
                    edgeV.prevVertex = v
                    edgeV.state = .Discovered
                }
            }
        }
        
        print("\(v.name),\(v.currentDistance)")
        v.state = .Finished
    }
    
    printPathRecursive(endV)
}


func printPathRecursive (endV:Vertex) {
    
    if endV.prevVertex == nil {
        
        print(endV.name)
        return
    }
    
    printPathRecursive(endV.prevVertex!)
    
    print(endV.name)
}

shortestDistanceRecursivePrint(graph2, startingV: aA, endV: cC)


//***********REcursion REview*************

func addUpIter(num: Int) -> Int {
    
    var sum = 0
    
    for i in 1...num {
        
        sum += i
    }
    
    return sum
}

func addUpRecursive(num:Int) -> Int {
    
    if num == 0 {
        
        return 0
    }

    return num + addUpRecursive(num - 1)
}
addUpIter(5)
addUpRecursive(5)


func factorial(num: Int) -> Int {
    
    var ans = 1
    for var n = 1; n<=num; n++ {
        
        ans*=n
    }
    return ans
}

func factorialREcursive(num: Int) -> Int {
    
    if num == 1 {return 1}
    
    
    
    return num * factorialREcursive(num - 1)
}

factorial(3)
factorial(3)
