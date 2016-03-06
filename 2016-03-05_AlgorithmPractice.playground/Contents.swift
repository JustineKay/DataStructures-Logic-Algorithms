//: Playground - noun: a place where people can play

import UIKit

//Given two strings, how do you find out if they are anagrams?
//ex. cinema & iceman are anagrams

//does each character have to have a matching character?

//create an array of all string characters

func anagram(strOne:String, strTwo:String) -> Bool{
    if strOne.characters.count != strTwo.characters.count {
        
        return false
    }
    
    let strOneSet = Set<Character>(strOne.lowercaseString.characters)
    let strTwoSet = Set<Character>(strTwo.lowercaseString.characters)
    
    if strOneSet.isSubsetOf(strTwoSet){
        
        return true
    }
    
    return false
}

let word1 = "cinema"
let word2 = "iceman"
let word3 = "heater"
let word4 = "reheat"

anagram(word1, strTwo: word2)
anagram(word3, strTwo: word4)

func anagram2(str1:String, str2:String) -> Bool{
    
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

let word5 = "teaches"
let word6 = "cheats"
let word7 = "beet"
let word8 = "beat"

anagram2(word5, str2: word6)
anagram2(word7, str2: word8)


/*
Given a linked list, a starting index, and an ending index. How would you shift the index so that the data at the ending index ends up at the starting index? [Find Two Ways]
*/

//ex. x -> 3 -> x -> x -> x -> 10 -> x
//         ^startingIdx         ^endingIdx


//To reverse all data in between the two indices
func reverseData(inout arr: [Int], startingIdx:Int, var endingIdx:Int) -> [Int]{
    
    for i in startingIdx...endingIdx/2 {
        swap(&arr[i], &arr[endingIdx])
        endingIdx--
    }
    
    return arr
}

var arr1 = [2, 3, 56, 76, 34, 10, 2]
reverseData(&arr1, startingIdx: 1, endingIdx: 5)

func reverseData2(inout arr: [Int], startingIdx:Int, var endingIdx:Int) -> [Int]{
    var reversedPortion = [Int]()
    
    while startingIdx < endingIdx {
        
        reversedPortion.append(arr[endingIdx])
        arr.removeAtIndex(endingIdx)
        endingIdx--
        
    }
    
    arr.insertContentsOf(reversedPortion, at: startingIdx)
    
    return arr
}

var arr2 = [2, 3, 56, 76, 34, 10, 2]
reverseData2(&arr2, startingIdx: 1, endingIdx: 5)

//To simply insert the ending idx at the starting idx
func reInsert(inout arr:[Int], startingIdx:Int, endingIdx: Int) -> [Int]{
    arr.insert(arr.removeAtIndex(endingIdx), atIndex: startingIdx)
    
    return arr
}

var arr3 = [2, 3, 56, 76, 34, 10, 2]
reInsert(&arr3, startingIdx: 1, endingIdx: 5)



/*

I give you a sorted array of ints and want you to return an array of Strings with the ranges so:

I give you: 1, 2, 3, 5, 6,  9, 12, 13, 14, 15

You return: { " 1-3 ", " 5-6 ", " 9 ", " 12-15 " }

*/

func ranges(arr:[Int]) -> [String]{
    
    var result = [String]()
    var range = [Int]()
    var rangeStr = String()
    
    for i in 1...arr.count - 1 {
        
        if arr[i - 1] != arr[i] - 1 {
            
            if range.isEmpty {
                
                range.append(arr[i - 1])
                rangeStr = "\(range[0])"
                result.append(rangeStr)
                
            }else {
                range.append(arr[i - 1])
                rangeStr = "\(range[0])-\(range[range.count-1])"
                result.append(rangeStr)
            }
            
            range = []
            rangeStr = ""
            
            
        }else {
            
            if range.isEmpty {
                
                range.append(arr[i - 1])
                range.append(arr[i])
                
            }else {
                
                range.append(arr[i])
            }
            
            
        }
        
        if i > arr.count - 2 {
            
            if range.isEmpty {
                
                range.append(arr[i])
                rangeStr = "\(range[0])"
                result.append(rangeStr)
                
            }else {
                
                rangeStr = "\(range[0])-\(range[range.count-1])"
                result.append(rangeStr)
            }
            
            
        }

        print(arr[i - 1])
        print(arr[i] - 1)
        print(range)
        print(result)
    }
    
    return result
}

var anotherArr = [1, 2, 3, 5, 6, 9, 12, 13, 14, 15]
ranges(anotherArr)

var notherArr = [1, 3, 4, 5, 7, 8, 9, 10, 12]
ranges(notherArr)