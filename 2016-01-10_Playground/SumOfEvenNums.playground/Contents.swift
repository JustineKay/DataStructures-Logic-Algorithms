//: Playground - noun: a place where people can play

import UIKit

func totalSumOfEvenNumbers(arr: [Int]) -> Int {
    
    var totalSum = 0
    
    for i in arr {
        
        if i % 2 == 0 {
            
            totalSum += i
        }
    }
    
    return totalSum
}

