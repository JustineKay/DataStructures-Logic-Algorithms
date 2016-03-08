//: Playground - noun: a place where people can play

import UIKit

//Fibonacci - given an idx return the fib value at idx

/*
Ex: [1, 1, 2, 3, 5, 8, 13, 21]
     0  1  2  3  4  5   6  7
Given idx = 5
Return = 8
*/

func fibonacci(idx:Int) -> Int {
  
    if idx < 2 {
        
        return 1
    }
    
    return fibonacci(idx - 1) + fibonacci(idx - 2)
}

fibonacci(5)

/*
"Given two numbers add them up and return an array or string version of the result.
E.g 36 + 56 = ""92"" or [9,2]
But one catch is you can only add single digit values"

*/

func digits(num: Int) -> [Int] {
    
    var numDigits = [Int]()
    
    var result = num
    var lastDigit = Int()
    
    for _ in 0..<Array(String(num).characters).count {
        
        lastDigit = result % 10
        numDigits.insert(lastDigit, atIndex: 0)
        result = result / 10
        
    }
    
    
    return numDigits
}

digits(36)

func numberFromArray(arr:[Int]) -> Int {
    
    var sum = Int()
    let tensCounter = arr[arr.count - 2] * 10
    
    for _ in 0..<tensCounter {
        
        sum += 1
    }
    
    sum += arr[arr.count - 1]

    return sum
}

numberFromArray([3,6])

func addSingleDigits(num1: Int, num2: Int) -> [Int] {
    
    var sumArr = [Int]()
    var sum = Int()
    
    sum = numberFromArray(digits(num1)) + numberFromArray(digits(num2))
    sumArr = digits(sum)
    
    return sumArr
}

addSingleDigits(36, num2: 56)