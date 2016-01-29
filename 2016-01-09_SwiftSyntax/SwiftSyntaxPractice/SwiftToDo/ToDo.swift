//
//  ToDo.swift
//  SwiftToDo
//
//  Created by Linus Liang on 1/8/16.
//  Copyright © 2016 Linus Liang. All rights reserved.
//

import Foundation

// return any positive integer greater than 1000
func returnAnyPositiveIntegerGreaterThan1000() -> Int? {
    return 1003
}


// return any negative float
func returnAnyNegativeDouble() -> Double? {
    return -34.21
}

// return a Bool
func returnABoolean() -> Bool? {
    return true
}

/* ======================= */


// return the sum of integerX and integerY
func returnTheSumOfIntegerXAndIntegerY(integerX: Int, integerY: Int) -> Int? {
    return integerX + integerY
}

// return the product of x and 100
func returnTheProductOfXAnd100(x: Double) -> Double? {
    return x * 100
}

// return true if x is greater than 10
// return false if x is less than or equal to 10
func isGreaterThan10(x: Double) -> Bool? {
   
    //return x > 10 ? true : false
    //return x > 10
    
    if x <= 10 {
        
        return false
    }
    
    return true
}

// return true if x is even
// return false if x is odd
func isEven(x: Int) -> Bool? {
    
    //return x % 2 == 0
    
    if x % 2 == 0 {
        
        return true
    }
    
    return false
}


// return the sum of all numbers between 0 and x
// include 0 and x.
func sumFrom0To(x:Int) -> Int? {
    
    //return Array(0...x).reduce(0, combine: +)
    
    var answer = 0
    
    for number in 0...x {
    answer += number
        
    }
    
    return answer
}

// return the 5th item (index 4) from the provided array
func get5thItem(arr: [AnyObject]) -> AnyObject? {

    return arr[4]
}

// Given a dictionary, return the value for a key
func returnValueForKey(dict: Dictionary<String,String>, key: String) -> String? {
    return dict[key]
}



// Provided a closure( same as obj-c block) as a parameter, simply execute the closure
func executeClosure(closure: ()->()) {
    
    closure()

}
