//: Playground - noun: a place where people can play

import UIKit

func isPalindrome(str:String) -> Bool {
    
    var characters = [Character]()
    
    for character in str.lowercaseString.characters {
        
        if isAlphanumeric(character) {
            
            characters.append(character)
        }
    }
    
    for i in 0..<characters.count/2 {
        
        let mirrorIdx = characters.count - i - 1
        
        if characters[i] != characters[mirrorIdx] {
            
            return false
        }
    }
    
    return true
}

func isAlphanumeric(c:Character) ->Bool {
    
    let letters = NSCharacterSet.letterCharacterSet()
    
    let s = String(c).unicodeScalars
    let uni = s[s.startIndex]
    
    let isALetter = letters.longCharacterIsMember(uni.value)
    
    return isALetter
}

var phrase = "Neil, an alien"
isPalindrome(phrase)


extension Character {
    
    var isAlphanumeric: Bool {
        
        let letters = NSCharacterSet.letterCharacterSet()
        
        let s = String(self).unicodeScalars
        let uni = s[s.startIndex]
        
        let isALetter = letters.longCharacterIsMember(uni.value)
        
        return isALetter
    }

}

var c = Character("$")
c.isAlphanumeric
var t = Character("t")
t.isAlphanumeric


func isPalindromeWithFilter(str:String) -> Bool {
    
    //filteredArray = moneyArray.filter({$0 > 30}) where {$0 > 30}
    
    var characters = [Character]()
    
    for character in str.lowercaseString.characters {
        
        if character.isAlphanumeric {
            
            characters.append(character)
        }
    }
    
    for i in 0..<characters.count/2 {
        
        let mirrorIdx = characters.count - i - 1
        
        if characters[i] != characters[mirrorIdx] {
            
            return false
        }
    }
    
    return true
}

isPalindromeWithFilter(phrase)
