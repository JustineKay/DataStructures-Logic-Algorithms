//: Playground - noun: a place where people can play

import UIKit

//***** Check if an array of parenthesis is balanced*****

func isBalanced(str: String) -> Bool
{
    
    var pStack = [Character]()
    
    for character in str.characters {
        
        
        switch character {
            
        case "(":
            pStack.append(character)
            
        case "{":
            pStack.append(character)
            
        case "[":
            pStack.append(character)
            
        default:
            if pStack.count != 0 {
                
            pStack.removeLast()
                
            }else {
                
                pStack.append(character)
            }
            
        }
        
        print(pStack)
    }
    
            
            
            return pStack.count == 0
}

let pStr = "(())"
let pStr2 = "{}{}}"
let pStr3 = ")()()(())"
let pStr4 = "()()(()(())"
let pStr5 = "(){}[]"
let pStr6 = "(]{)[}"

isBalanced(pStr)
isBalanced(pStr2)
isBalanced(pStr3)
isBalanced(pStr4)
isBalanced(pStr5)
isBalanced(pStr6)