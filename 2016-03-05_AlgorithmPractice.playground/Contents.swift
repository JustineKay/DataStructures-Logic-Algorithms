//: Playground - noun: a place where people can play

import UIKit

//Given two strings, how do you find out if they are anagrams?
//ex. cinema & iceman are anagrams

//does each character have to have a matching character?

//create an array of all string characters

func anagram(strOne:String, strTwo:String) -> Bool
{
    let strOneSet = Set<Character>(strOne.lowercaseString.characters)
    let strTwoSet = Set<Character>(strTwo.lowercaseString.characters)
    
    if strOneSet.isSubsetOf(strTwoSet){
        
        return true
    }
    
    return false
}

let word1 = "cinema"
let word2 = "iceman"
let heater = "heater"
let reheat = "reheat"

anagram(word1, strTwo: word2)
anagram(heater, strTwo: reheat)

func anagram2(str1:String, str2:String) -> Bool
{
    
    if str1.characters.count != str2.characters.count {
        
        return false
    }
    
    var str1Sorted = str1.lowercaseString.characters.sort()
    var str2Sorted = str2.lowercaseString.characters.sort()
    
    for i in 0..<str1Sorted.count {
        
        if str1Sorted[i] != str2Sorted[i] {
            
            return false
        }
        
    }
    
    return true
}

let word3 = "teacher"
let word4 = "cheaters"
let word5 = "beet"
let word6 = "beat"

anagram2(word3, str2: word4)
anagram2(word5, str2: word6)

