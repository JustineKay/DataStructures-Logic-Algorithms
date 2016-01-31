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
    
    private var elements = [String?](count: 128, repeatedValue: nil)
    
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
        
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
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
genres.elements.description


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




//**********EXERCISES*************

/*
Use our set implementation from in class 
to write a simple spellCheck function that 
returns true if the string has no spelling errors. 

 - Use a dictionary of 6 words
 - Test your method both with a string that passes
    and a string that fails.
*/



var dict = StringHashSet()
dict.add("the")
dict.add("quick")
dict.add("brown")
dict.add("fox")
dict.add("jumps")
dict.add("over")
dict.description

print(dict.elements.filter{$0 != nil})


func spellCheck(str: String) -> Bool
{
    
    let strWords = str.characters.split{$0 == " "}.map(String.init)
    
    for word in strWords {
        
        if !dict.contains(word) {
            
            return false
        }
    }
    
    return true
}



spellCheck("the quick brown fox jumps over fox brown jumps quick")
spellCheck("the quick brwon fox jumps over fox brown jumps quick")


//******With SWift Set*********

var spellDict = Set<String>()

for word in ["the", "quick", "brown", "fox", "jumps", "over", "truck"] {
    spellDict.insert(word)
}

spellDict

func spellCheck3(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck3("the quick brown truck jumps over fox brown jumps quick")
spellCheck3("the quick brwon truck jumps over fox brown jumps quick")


//****Good, Bad or Invalid Hash Maps**************

func sumHash(s: String) -> Int {
    // Sum of all character codes in s
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 &+ $1}))
}

sumHash("Hello")
sumHash("awesome")

sumHash("rat")
sumHash("tar")


func productHash(s: String) -> Int {
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 &* 256 &+ $1}))
}

productHash("Hello")
productHash("awesome")

productHash("rat")
productHash("tar")


//invalid
func dateHash(date: NSDate) -> Int {
    return Int(date.timeIntervalSinceNow)
}



//**************************************************
//**************************************************
//**************************************************

abs("asdf".hashValue % 32)
abs("foo".hashValue % 32)
abs("racecar".hashValue % 32)
abs("watermelon".hashValue % 32)
abs("fruitcake".hashValue % 32)
abs("fruit".hashValue % 32)
abs("cake".hashValue % 32)
abs("sweet".hashValue % 32)


//*******************Open Addressing**********************

struct OpenHashSet: SetProtocol, CustomStringConvertible {
    
    private var elements: [String?]
    
    init(capacity: Int) {
        
        elements = [String?](count: capacity, repeatedValue: nil)
    }
    
    // SetProtocol
    typealias ItemType = String
    
    mutating func add(item: String) {
        
        let hashValue = hash(item)
        
        if (contains(item)) { return }
        
        for i in 0..<elements.count {
            
            if (elements[(hashValue + i) % elements.count] == nil) {
                
                elements[(hashValue + i) % elements.count] = item
                
                return
            }
        }
        
        print("Out of room!")
    }
    
    mutating func remove(item: String) {
        
        let hashValue = hash(item)
        
        if !contains(item) {return}
        
        for i in 0..<elements.count {
            
            if elements[(hashValue + i) % elements.count] == item {
                
                elements.removeAtIndex((hashValue + i) % elements.count)
                
            }
        }
        
    }
    
    func contains(item: String) -> Bool {
        
        let hashValue = hash(item)
        
        for i in 0..<elements.count {
            
            if let element = elements[(hashValue + i) % elements.count] {
                
                if (element == item) {
                    return true
                }
            
            } else {
                
                return false
            }
        }
        
        return false
    }
    
    // CustomStringConvertible
    var description: String {
    
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
        
    }
    
}

var genres2 = OpenHashSet(capacity: 16)

genres2.add("Pop")
genres2.add("Pop")
genres2.add("Rock")
genres2.add("R&B")
genres2.add("Funk")

genres2.contains("Rock")
genres2.contains("Western")

genres2.remove("Pop")
genres2.contains("Pop")




//****************MAPS**********************

protocol MapProtocol {
    typealias KeyType
    typealias ValueType
    subscript(k: KeyType) -> ValueType? {get set}
    mutating func remove(k: KeyType)
}


// An array of elements where each element is
//    An array of elements where each element is
//        A tuple of K, V


struct HashMap<K: Hashable, V>: MapProtocol , CustomStringConvertible {
    
    var table: [[(K, V)]]
    
    init(capacity: Int = 8) {
        
        table = [[(K,V)]](count: capacity, repeatedValue: [])
    }
    //Map protocol
    
    typealias KeyType = K
    typealias ValueType = V
    
    subscript(k: K) -> V? {
        
        get {
            let hashValue = abs(k.hashValue % table.count)
            for item in table[hashValue] {
                
                if (item.0 == k) {
                    
                    return item.1
                }
            }
            return nil
        }
        set (v){
            
            let hashValue = abs(k.hashValue % table.count)
            table[hashValue].append((k,v!))
        }
    }
    
    mutating func remove(k: K) {
        
        let hashValue = abs(k.hashValue % table.count)
        
        if let idx = table[hashValue].indexOf({$0.0 == k}) {
            
            table[hashValue].removeAtIndex(idx)
        }
        
    }
    
    //Custom String Convertible
    
    var description: String {
        
        var str = ""
        
        for entry in table {
            str += "\(entry)"
            str += "\n"
        }
        
        return str    }
}


var nicknames = HashMap<String, String>()

nicknames["Michael"] = "Mike"
nicknames["Barbara"] = "Babs"
nicknames["Janet"] = "Jenny"
nicknames["Matthew"] = "Matt"
nicknames["Fredrick"] = "Fred"
print(nicknames)

nicknames["Michael"]

nicknames.remove("Michael")
nicknames["Michael"]
