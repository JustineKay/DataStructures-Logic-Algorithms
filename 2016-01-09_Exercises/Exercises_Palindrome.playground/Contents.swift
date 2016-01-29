//: Playground - noun: a place where people can play

import UIKit

let i = [1, 2, 3, 4, 5].map { $0 * 2 }
print(i)

let j = [1, 2, 3, 4, 5].filter { $0 % 2 == 0 }

print(j)

let k = [1, 2, 3, 4, 5].reduce(0, combine: +)

print(k)



func isPalindrome(word: String) -> Bool {
    
    let wordLength = word.characters.count
    
    for i in 0...wordLength/2 {
        
        if Array(word.characters)[i] != Array(word.characters)[wordLength - i - 1] {
            
            return false
        }
    }
    
    return true
}

func isPalindromic(word: String) -> Bool {
    
    return String (word.characters.reverse()) == word
}

//T refers to the type that it is instantiated with
struct Stack<T> {
    
    var items: [T]
    
    //default initializer
    //    init(items: [T]) {
    //
    //        self.items = items
    //    }
    
    var count: Int {
        
        return items.count
    }
    
    mutating func push(element: T) {
        
        items.append(element)
    }
    
    mutating func pop() -> T {
        
        return items.removeLast()
    }
}

//let intStack = Stack<Int>()

func isPalindromic2(word: String) -> Bool {
    
    var stack = Stack<Character>(items: Array(word.characters))
    
    var reverseStack = Stack<Character>(items: Array(word.characters).reverse())
    
    for _ in 0..<stack.count {
        
        if stack.pop() != reverseStack.pop() {
            
            return false
        }
    }
    
    return true
}

isPalindrome("racecar")
isPalindromic("racecar")
isPalindromic("bubble")
isPalindromic2("bubble")



//*********Come back and review this...

//func findMissingNumber(number: Int) {
//    
//    var num = 0
//    var completeArr: [Int] = []
//    
//    for i in 0...number {
//        
//        num += 1
//        completeArr.append(num)
//    }
//    
//}


//Jovanny's solution
func findMissing (N: Int, list: [Int]) -> Int {
    
    var totalSumOfArray = 0
    var totalSumOfList = 0
    
    for i in 1...N {
        
        totalSumOfArray += i
    }
    
    for i in list {
        
        totalSumOfList += i
    }
    
    return totalSumOfArray - totalSumOfList
    
}


//Kaira's solution
func missingNumber (N: Int, list: [Int]) -> Int {
    
    list.sort({$0 < $1})
    var j = 0
    var missingNum = 0
    
    for i in 0..<list.count {
        
        j = i + 1
        if j-1 != 1 {
            
            missingNum = i
        }
    }
    return missingNum
}

//Linus's solution
func findNum(N: Int, list: [Int]) -> Int {
    let totalSum = N * (N + 1) / 2
    var totalSumOfList = 0
    for i in list {
        totalSumOfList += i
    }
    return totalSum - totalSumOfList
}

//Jackie's solution
func findWhatsMissing(list: [Int]) -> Int {
    let complete = Set<Int>(Range(start: 1, end: list.count+1))
    let incomplete = Set<Int>(list)
    return Array(complete.subtract(incomplete)).first!
}

let arr = [1,5,6,3,2]
let N = arr.count + 1

findMissing(N, list: arr)
missingNumber(N, list: arr)
findNum(N, list: arr)
findWhatsMissing(arr)


//Given a list  of size N containing numbers 1 - N (inclusive). return true if there are duplicates, false if not
func hasDuplicates(arr: [Int]) -> Bool {
    
    for i in 0..<arr.count {
        
        for j in 0..<arr.count {
            
            if i != j && arr[i] == arr[j] {
                
                return true
            }
        }
    }
    
    return false
}

let list = [2, 5, 1, 3, 3]
let N2 = list.count
hasDuplicates(list)

let list3 = [3, 2, 1]
let N3 = list3.count
hasDuplicates(list3)


//Given two lists, find the smallest value that exists in both lists.
func getSmallestCommonValue(list1: [Int], list2: [Int]) -> Int? {
    
    let sortedList1 = list1.sort()
    let sortedList2 = list2.sort()
    
    for numInList1 in sortedList1 {
        
        for numInList2 in sortedList2 {
            
            if numInList1 == numInList2 {
                
                return numInList1
            }
        }
    }
    
    return nil
}

let list4 = [56, 23, 7, 78]
let list5 = [78, 79, 101, 23]
getSmallestCommonValue(list4, list2: list5)

let list6 = [34, 1, 7, 78]
let list7 = [78, 7, 101, 23]
getSmallestCommonValue(list6, list2: list7)


//Check to see if an integer is a palindrome don’t use casting
func isPalindrome(var num: Int) -> Bool {
    
    let orgNum = num
    var newNum = 0
    
    while(num > 0) {
        
        newNum *= 10
        newNum += num % 10
        num /= 10
    }
    
    return newNum == orgNum
    
}

let number = 12321
let number2 = 134543
isPalindrome(number)
isPalindrome(number2)


func multiplyByAddition(let numA: Int, let numB: Int) -> Int{
    
    var sum = 0
    
    for i in 0...numB {
        
        sum += numA
    }
    
    return sum
}

