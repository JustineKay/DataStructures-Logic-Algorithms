//: Playground - noun: a place where people can play

import UIKit
/*
// number of elements
var n = Int(readLine()!)!

// read array
var arr = readLine()!.characters.split(" ").map(String.init)

// variable to hold the sum of the array elements
var sum = 0

for (var i = 0; i < n; i++) {
    // sum the array elements
    
   sum += Int(arr[i])!
}

// print the array elements
print(sum)

*/
//***********************************************************
/*
// number of elements in each row
var n = Int(readLine()!)!

// read array rows
var row1 = readLine()!.characters.split(" ").map(String.init)
var row2 = readLine()!.characters.split(" ").map(String.init)
var row3 = readLine()!.characters.split(" ").map(String.init)

var matrix = [row1, row2, row3]

var sum1 = 0
var sum2 = 0

for i in 0..<n {
sum1 += Int(matrix[i][i])!
sum2 += Int(matrix[matrix.count - 1 - i][i])!
}

var difference = sum1 - sum2
// print the array elements
print(abs(difference))

*/

func diagonalsDifference(row1:String, row2: String, row3: String) -> Int {
    
    
    var rowOne = row1.characters.split(" ").map(String.init)
    var rowTwo = row2.characters.split(" ").map(String.init)
    var rowThree = row3.characters.split(" ").map(String.init)
    
    var matrix = [rowOne, rowTwo, rowThree]
    var sum1 = 0
    var sum2 = 0
    
    for i in 0..<matrix.count {
        
        sum1 += Int(matrix[i][i])!
        //print("sum1:\(sum1)")
        
        sum2 += Int(matrix[matrix.count - 1 - i][i])!
        //print("sum2:\(sum2)")
        
    }
    
    var difference = sum1 - sum2
    
    return abs(difference)
}

let row1 = "11 2 4"
let row2 = "4 5 6"
let row3 = "10 8 -12"

diagonalsDifference(row1, row2: row2, row3: row3)

//*************************************************

/*
// number of elements in each row
var n = Float(readLine()!)!

// read array rows
var arr = readLine()!.characters.split(" ").map(String.init)

var positives: Float = 0.0
var negatives: Float = 0.0
var zeros: Float = 0.0

for num in arr {

let number = Float(num)

if number > 0 {

positives += 1

}else if number < 0 {

negatives += 1

}else {

zeros += 1
}
}

positives = positives / n
negatives = negatives / n
zeros = zeros / n

print(positives)
print(negatives)
print(zeros)
*/

func printPositivesNegativesZeros(str: String) {
    
    var arr = str.characters.split(" ").map(String.init)
    var count = Float(arr.count)
    
    var positives: Float = 0.0
    var negatives: Float = 0.0
    var zeros: Float = 0.0
    
    for num in arr {
        
        let number = Float(num)
        
        if number > 0 {
            
            positives += 1
            
        }else if number < 0 {
            
            negatives += 1
            
        }else {
            
            zeros += 1
        }
    }
    
    positives = positives / count
    negatives = negatives / count
    zeros = zeros / count
    
    print(positives)
    print(negatives)
    print(zeros)
}

printPositivesNegativesZeros("-4 3 -9 0 4 1")

//************************************************
/*

Your teacher has given you the task of drawing a staircase structure. Being an expert programmer, you decided to make a program to draw it for you instead. Given the required height, can you print a staircase as shown in the example?

Input
You are given an integer N depicting the height of the staircase.

Output
Print a staircase of height N that consists of # symbols and spaces.
For example for N=6, here's a staircase of that height:

     #
    ##
   ###
  ####
 #####
######

Submitted answer:

var n = Int(readLine()!)!

var count = 0

while n > 0 {

var stair = ""

n--
count++

for _ in 0..<n {

stair += " "
}

for _ in 0..<count {

stair += "#"
}

print(stair)

}


*/

func printStaircase(var stairs: Int) {
  
    var count = 0
    
    while stairs > 0 {
        
        var stair = ""
        
        stairs--
        count++
        
        for _ in 0..<stairs {
            
            stair += " "
        }
        
        for _ in 0..<count {
            
            stair += "#"
        }
        
        print(stair)
        
    }
}

printStaircase(6)

func printStaircaseRecursively(n: Int) {
    
    func printStair(n: Int, counter: Int) {
        
        var stair = ""
        
        for _ in 0..<n {
            
            stair += " "
        }
        
        for _ in 0..<counter {
            
            stair += "#"
        }
        
        if n >= 0 {
            
            print(stair)
            
            if n > 0 {
                printStair(n - 1, counter: counter + 1)
            }
        }
        

    }
    
    
    printStair(n, counter: 0)

}

printStaircaseRecursively(6)

//************************************************

/*

Given a time in AM/PM format, convert it to military (24-hour) time.

Sample Input -> 07:05:45PM
Sample Output -> 19:05:45

Explanation

7 PM is after noon, so you need to add 12 hours to it during conversion. 12 + 7 = 19. Minutes and seconds do not change in 12-24 hour time conversions, so the answer is 19:05:45.

*/

func militaryTime(inout time:String) -> String {
    
    var result = Array(time.characters)
    
    let hour = String(result[0]) + String(result[1])
    result.removeRange(0...1)
    
    let timeOfDay = String(result[result.count - 2]) + String(result[result.count - 1])
    result.removeRange(result.count - 2...result.count - 1)
    
    var militaryHour = Int(hour)!
    
    if timeOfDay == "PM" {
        
        militaryHour += 12
        
    }
    
    time = String(militaryHour) + String(result)
    
    return time
}
var time = "07:05:45PM"
militaryTime(&time)

