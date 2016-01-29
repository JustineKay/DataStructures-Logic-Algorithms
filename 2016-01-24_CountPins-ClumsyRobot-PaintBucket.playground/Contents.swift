//: Playground - noun: a place where people can play

import UIKit

//***** recursion. mind blown. ******

func countPins(rows: Int) -> Int {

    // How many pins in the first row (tip of the triangle)?
    if rows == 1 {
        return 1
    }
    
    // How many pins in the nth row?
    var pins = rows;
    
    // How many pins in the rest of the triangle?
    pins += countPins(rows - 1)
    
    return pins
}


func countPinsSimplified(rows: Int) -> Int {
    
    if rows == 1 {
        return 1
    }
    
    return rows + countPins(rows - 1)
}

//Tail Recursion

func countPinsTail(rows: Int, pinsSoFar: Int = 0) -> Int {
    if rows == 0 {
        return pinsSoFar
    }
    return countPinsTail(rows - 1, pinsSoFar: rows + pinsSoFar)
}

countPins(10)
countPinsSimplified(10)
countPinsTail(10)



//Clumsy Robot

//tryStep - robot will attempt to go up the step
//but may fail and fall down
//returns boolean to let us know 

//step up guarantees the robot will step up if try step is not successful

var stepNum = 0

func tryStep() -> Bool {
    
    let success = Int(arc4random_uniform(2)) > 0
    
    if (success) {
        stepNum++
        print("Yay! \(stepNum)")
    } else {
        stepNum--;
        print("Ow!  \(stepNum)")
    }
    return success
}


func tryStepSimplified() ->Bool
{
    
    return arc4random_uniform(2) > 0
}


func stepUp() {
    
    if tryStep() {
        // We’re done!
        return
    }
    // Now we’re two steps below where we want to be :-(
    stepUp()
    stepUp()
}

stepUp()



//Fibonacci Sequence
//add numbers sequentially

let fibSeq = [1, 1, 2, 3, 5, 8, 13]
//            0  1  2  3  4  5  6

//find fib value of any number
func fib(n: Int) -> Int
{
    //print("X")
    if n == 0 || n == 1 {
        
        return 1
    }
    
    return fib(n-1) + fib(n-2)
    
}

fib(6)
//fib(10)
//fib(15)  //almost too large...


//*****
//    //indices is a range from the lowest index to the highest
//    if cache.indices ~= n {
//
//        return cache[n]
//    }
//*****


//***Memoization***

var cache = [Int:Int]()
cache[0] = 1
cache[1] = 1

func fibMemo(n: Int) -> Int
{
    //adding a cache
    //if our value is already in the cache then return it
    if cache[n] != nil {
        
        return cache[n]!
    }
    
    //if the value is not in the cache then add it
    
    let value =  fibMemo(n-1) + fibMemo(n-2)
    
    cache[n] = value
    
    return value
}

fibMemo(60)


//***EXERCISES***
/*

1.
Write a recursive function definition for:
*/

//a. sum(xs: [Int]) -> Int (adds up all the numbers in xs)

var xs = [2, 4, 6, 8, 10]
var xs1 = [2, 4, 6, 8, 10]
var xs2 = [2, 4, 6, 8, 10]

var sum = 0

func sum(var xs: [Int]) -> Int
{
    
    if xs.count == 0{
        
        return sum
    }
    
    sum += xs[xs.count-1]
    xs.removeLast()
    
    return sum(xs)
}

sum(xs)

//without global variable

func sumSolution(xs:[Int]) -> Int
{
    if xs.isEmpty {
        
        return 0
        
    }else {
        
        return xs[0] + sumSolution(Array(xs.dropFirst()))
    }
    
}

func sumSolution2(var xs:[Int]) -> Int
{
    if xs.isEmpty {
        
        return 0
        
    }else {
        
        let x = xs.popLast()!
        
        return x + sumSolution2(xs)
    }
    
}

sumSolution(xs1)
sumSolution2(xs2)

//b. contains(xs: [Int], y: Int) -> Bool (true if x is in the (unsorted) array xs)


func contains(xs: [Int], y: Int) -> Bool
{
    
    if xs.isEmpty {
        
        return false
    
    }else if (xs[0] == y){
        
        return true
    
    }else {
        
        return contains(Array(xs.dropFirst()), y: y)
    }
    
}

contains([1, 2, 4, 5, 6], y: 3)
contains([1, 2, 3, 4, 5], y: 3)


//c. factorial(x: Int) -> Int

func factorialX(x:Int) -> Int{
    
    if x == 1 {
        
        return 1
    
    }else {
        
        return factorialX(x - 1) * x
    }
}

func factorialTailRecursive(x: Int, soFar: Int = 1)-> Int
{
    
    if x == 1{
        
        return soFar
    
    }else {
        
        return factorialTailRecursive(x - 1, soFar: x * soFar)
    }
    
}

//****Print Img****

var image =
[[0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 1, 1, 1],
    [0, 1, 0, 0, 0, 1, 0, 1],
    [0, 0, 1, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0, 0],
    [1, 1, 1, 0, 0, 0, 0, 1]]


func printImg(img: [[Int]]) {
    for row in img {
        for cell in row {
            switch(cell) {
            case 0: print(".", terminator: "")
            case 1: print("#", terminator: "")
            default: print("|", terminator: "")
            }
        }
        print("")
    }
    print("")
}

//Recursive
func floodFill(
    inout img: [[Int]],
    withColor: Int,
    overColor: Int,
    x: Int,
    y: Int)
{
    if img.indices ~= x {
        return
    }
    
    if img[x][y] != overColor {
        
        return
    }
    
    img[x][y] = withColor
    
    floodFill(&img, withColor: withColor, overColor: overColor, x: x, y: y - 1)
    floodFill(&img, withColor: withColor, overColor: overColor, x: x, y: y + 1)
    floodFill(&img, withColor: withColor, overColor: overColor, x: x + 1, y: y)
    floodFill(&img, withColor: withColor, overColor: overColor, x: x - 1, y: y)
    
}

// later ...


printImg(image)
floodFill(&image, withColor: 2, overColor: 0, x: 0, y: 0);
printImg(image)
