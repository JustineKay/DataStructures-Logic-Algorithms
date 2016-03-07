//: Playground - noun: a place where people can play

import UIKit

/*
Write a function to determine if the parenthesis in a String are both balanced and valid.
Input: (), (()), ()(), (()())
Output:True 

Input: )(, ))(, ()), ()))((
Output: False

*/

func isBalancedAndValid(str:String) -> Bool {
    
    let input = str.characters
    var collectedParenthesis = [Character]()
    
    for char in input {
        
        if char == "," {
            
            if !collectedParenthesis.isEmpty {
                
                return false
            }
        }
        
        if char ==  "("  {
        
            collectedParenthesis.append(char)
        
        }else if char == ")"{
        
            if collectedParenthesis.isEmpty {
                
                return false
            
            }else {
            
                collectedParenthesis.removeLast()
            }
        }
    }
    
    if collectedParenthesis.isEmpty {
        
        return true
    }
    
    return false
}

var example1 = "(), (()), ()(), (()())"
var example2 = ")(, ))(, ()), ()))(("

isBalancedAndValid(example1)
isBalancedAndValid(example2)


/*
Given a String, return a String without duplicates.
*/

func duplicatesRemoved(inout str:String) -> String {
    
    var result = [Character]()
    var unsortedDuplicatesRemoved = Set<Character>()
    
    for char in str.characters{
        
        if !unsortedDuplicatesRemoved.contains(char){
            
            result.append(char)
            unsortedDuplicatesRemoved.insert(char)
        }
        
    }
    
    str = String(result)
    
    return str
}

var example3 = "Double Bubble"
var example4 = "Watermelon"
duplicatesRemoved(&example3)
duplicatesRemoved(&example4)