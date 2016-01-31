//: Playground - noun: a place where people can play

import UIKit


//*********** SETs ****************

var primaryColors: Set<String> = ["red", "green"]
primaryColors.insert("blue")

var secondaryColors: Set<String> = ["yellow", "cyan"]
var favColors: Set<String> = ["red", "yellow"]

let allColors = primaryColors.union(secondaryColors)

primaryColors.intersect(favColors)

allColors.subtract(secondaryColors)

allColors.isSubsetOf(secondaryColors)
secondaryColors.isSubsetOf(favColors)

//no elements in common
secondaryColors.isDisjointWith(primaryColors)
secondaryColors.intersect(primaryColors).isEmpty

favColors.isDisjointWith(primaryColors)


//*********Create a Set***************

protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}


struct ArraySet<T: Equatable>: SetProtocol, CustomStringConvertible {
    
    var elements = [T]()
    
    typealias ItemType = T
    
    mutating func add(item: T) {
        
        if !contains(item){
            
            elements.append(item)
        }
    }
    
    mutating func remove(item: T) {
        
        if let idx = elements.indexOf(item) {
            
            elements.removeAtIndex(idx)
        }
    }
    
    func contains(item: T) -> Bool {
        
        //swift convenience method
        //elements.contains(item)
        
        for element in elements {
            
            if element == item {
                
                return true
            }
        }
        return false
    }
    
    //Custom String Convertible
    var description: String {
        
        return "{\(elements)}"
    }
}


var colors = ArraySet<String>()
colors.add("blue")
colors.contains("blue")
colors.contains("red")
colors.add("green")
colors.add("orange")

colors.remove("blue")
colors.contains("blue")

colors.add("brown")
colors.add("brown")

colors.remove("brown")


//***********HASH FUNC*************


"Hello".nulTerminatedUTF8
"Hello".unicodeScalars
"Hello".unicodeScalars.first!.value

func hash(x: String) -> Int
{
    
    return Int(x.unicodeScalars.first!.value)
}


hash("Western")
hash("Pop")
hash("Rock")

//collision
hash("R&B")

//Swift convenience method
"Hello".hashValue
"Rock".hashValue
"R&B".hashValue



struct StringHashSet: SetProtocol, CustomStringConvertible {
    
    var elements = [String?](count: 128, repeatedValue: nil)
    
    //SetProtocol
    
    typealias ItemType = String
    
    mutating func add(item: String) {
        
        elements[hash(item)] = item
    }
    
    mutating func remove(item: String) {
        
        elements[hash(item)] = nil
    }
    
    func contains(item: String) -> Bool {
    
        return elements[hash(item)] == item
    }
    
    //Custom String Convertible
    
    var description: String {
        
        return "{\(genres.elements.filter{$0 != nil}.map{$0!})}"
        //See FILTER and MAP below****************************
    }
    
}

var genres = StringHashSet()

genres.add("Rock")
genres.add("Rock")
genres.add("Pop")
genres.add("Western")

genres.description

genres.contains("Rock")

genres.remove("Western")
genres.contains("Western")

genres.add("R&B")
genres.description


print(genres.elements.filter{$0 != nil})


//***************FILTER*********************
//take a function as an argument
//$0 represents every item in the array/list/set/etc

let furniture = ["chair", "desk", "ottoman", "sofa", "bed"]

print(furniture.filter{$0.characters.count > 4})



let items = ["Aardvark", "Adam", "Apple", "Bear", "Cat"]

func startsWithA(item: String) ->Bool {
    
    return item.characters.first! == Character("A")
}

startsWithA("Apple")
startsWithA("Bear")

items.filter(startsWithA)

print(items.filter({ (item) in item.characters.first! == Character("A")}))

print(items.filter({ $0.characters.first! == Character("A")}))

print(items.filter{ $0.characters.first! == Character("A")})



//***************MAP******************
func dropFirstChar(s: String) -> String
{
    
    return String(s.characters.dropFirst())
}

items.map(dropFirstChar)



//This:
print(furniture.map{$0.characters.count})


//Is essentially this:
func numberOfCharacters(item: String) -> Int
{
    
    return item.characters.count
}

print(furniture.map(numberOfCharacters))


//***********REDUCE****************

print(furniture.reduce("foo ", combine: {$0 + $1}))
