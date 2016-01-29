//: Playground - noun: a place where people can play

import UIKit

var arr = [34, 65, 123, 1, 6, 45]

func bubbleSort(var arr: [Int]) -> Array<Int>
{
    
    for j in 0...arr.count-1 {
        
        for i in 0...arr.count-1 {
            
            var temp = 0
            
            if arr[i] > arr[j] {
                
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
                
            }
        }
    }
    
   return arr
}


bubbleSort(arr)


func swap(inout arr: [Int], idx1: Int, idx2: Int) {
    
    var temp = arr[idx1]
    arr[idx1] = arr[idx2]
    arr[idx2] = temp
}

func cocktailSort(var arr: [Int]) ->[Int] {
    
    for j in 0...arr.count-1 {
        
        for i in 0...arr.count-1 {
            
            if arr[i] > arr[j] {
                
                swap(&arr, idx1: i, idx2: j)
                
            }
        }
        
        for i in 0..<arr.count-1 {
            
            if arr.count-1-i > arr.count-2-i {
                
                swap(&arr, idx1: arr.count-1-i, idx2: arr.count-2-i)
            }
        }
    }
    
    return arr

}

func cocktailSort2(inout arr:[Int]) ->[Int]
{
    var swapped = true
    
    while swapped {
        
        swapped = false
        
        for i in 0..<arr.count-1 {
            
            if arr[i] > arr[i+1] {
                
                swap(&arr, idx1: i, idx2: i+1)
                swapped = true
            }
        }
        
        for i in 0..<arr.count-1 {
            
            if arr[arr.count-1-i] < arr[arr.count-2-i] {
                
                swap(&arr, idx1: arr.count-1-i, idx2: arr.count-2-i)
            }
        }

    }
    
    
    return arr
}

cocktailSort2(&arr)
cocktailSort(arr)



//Gandolf problem from hackerrank
//*******************************

//let firstLine = readLine(stripNewline: true)!
//let T = Int(firstLine)!
//
//for _ in 0..<T {
//    
//    //each testcase has two lines
//    
//    let firstTestLine = readLine(stripNewline: true)!
//    let secondTestLine = readLine(stripNewline: true)!
//    
//    //first testline is number of towns Int
//    
//    let N = Int(firstTestLine)!
//    
//    //second testline is array of number of Routes
//    
//    let arrRoutes = secondTestLine.characters.split{$0 == " "}.map(String.init)
//    //let arrRoutes = secondTestLine.characters.split(" ")
//    
//    
//    //solve the riddle
//    
//    var ans = 1
//    
//    for character in arrRoutes {
//        
//        var numOfRoutes = Int(String(character))!
//            
//        ans *= numOfRoutes
//
//    }
//    
//    ans %= 1234567
//    
//    print(ans)
//    
//}





var sudokuArr = [[2,7,1,9,5,4,6,8,3],
                 [5,9,3,6,2,8,1,4,7],
                 [4,6,8,1,3,7,2,5,9],
                 [7,3,6,4,1,5,8,9,2],
                 [1,5,9,8,6,2,3,7,4],
                 [8,4,2,3,7,9,5,6,1],
                 [9,8,5,2,4,1,7,3,6],
                 [6,1,7,5,9,3,4,2,8],
                 [3,2,4,7,8,6,9,1,5]]


//first find duplicates in an array

func hasDuplicatesSudoku(arr:[Int]) -> Bool {
    
    //create an array of false bools to match the input array
    
    var numberArr = Array(count: arr.count, repeatedValue: false)
    
    //loop through the input arr and change 
    //the bool of the same index as the integer 
    //in the corresponding array
    
    for num in arr {
        
        //Check (the input num - 1)index of the boolean arr
        
        //If the num is a dup, on the second time around
        //the index of the boolean arr will have already 
        //been changed to true, so return true
        
        if numberArr[num - 1] == true {
            
            return true
        }
        
        //Else change (the input num - 1)index of the boolean arr
        //to true
        
        numberArr[num - 1] = true
    }
    
    return false
}

hasDuplicatesSudoku(sudokuArr[0])
hasDuplicatesSudoku(sudokuArr[3])



func sudokuSolved(grid: [[Int]]) ->Bool
{
    
    for i in 0..<grid.count {
        
        // checking rows
        
        if hasDuplicatesSudoku(grid[i]){
            
            return false
        }
        
        
        // checking columns & squares
        
        var columnArr: [Int] = []
        var square: [Int] = []
        
        for j in 0..<grid.count {
            
            columnArr.append(grid[j][i])
            square.append(grid[(i / 3) * 3 + j / 3][i * 3 % 9 + j % 3])
        }
        
        print("column \(columnArr)")
        //print("squares \(square)")
        
        if hasDuplicatesSudoku(columnArr) {
            
            return false
        }
        
        if hasDuplicatesSudoku(square) {
            
            return false
        
        }
    }
    
    return true
}

sudokuSolved(sudokuArr)

/*
http://codereview.stackexchange.com/questions/46033/sudoku-checker-in-java

This part is relatively simple. It gives the correct "column" by help of implicit integer conversion:

The first part of the equation is a little difficult:
(i / 3) * 3 + j / 3

(i / 3)
0,1,2↦0
3,4,5↦1
6,7,8↦2

take it * 3 and you got the sqare you want to get in to. 
then if we now iterate row-wise, we need to jump to 
the next column every 3 Elements. 
That's done with j / 3.


Now for the difficult one:
i * 3 % 9 + j % 3

(i * 3 % 9)
0,3,6↦0
1,4,7↦3
2,5,8↦6

This one is for "jumping" the sqares vertically. 
Then we just have to iterate 0, 1, 2. 
This is accomplished by running the % 3 operation.

*/
func booleanArr (arr:[Int]) -> [Bool]{
    
    //create an array of false bools to match the input array
    
    let booleanArr = Array(count: arr.count+1, repeatedValue: false)
    
    return booleanArr

}


func possibleNumbers(arr:[Int], inout booleanArr: [Bool]) -> [Bool] {
    
    
    //loop through the input arr and change
    //the bool of the same index as the integer
    //in the corresponding array
    
    for num in arr {
        
        //Change (the input num)index of the boolean arr
        //to true
        
        booleanArr[num] = true
    }
    
    
    
    
    return booleanArr
}

func allPossibleNumbers(booleanArr: [Bool]) -> [Int]
{
    
    var possibleNums = [Int]()
    
    //If the bool in our boolean arr is false
    //add that index num to our availableNum arr
    
    for i in 1..<booleanArr.count {
        
        if booleanArr[i] == false {
            
            possibleNums.append(i)
        }
        
    }
    
    return possibleNums
}


func getValidNumbers(sudokuBoard:[[Int]], row:Int, col:Int) -> [Int]
{
    
    var validNums = [Int]()
    
    
    // create row array
    let rowArr = sudokuBoard[row]
    print("row \(rowArr)")
    
    var columnArr: [Int] = []
    var square: [Int] = []
    
    for i in 0..<rowArr.count{
        
        columnArr.append(sudokuBoard[i][col])
        square.append(sudokuBoard[(col / 3) * 3 + i / 3][col * 3 % 9 + i % 3])
    }
    
    print("column \(columnArr)")
    print("squares \(square)")
    
    //for each array: row, column, square
    //find possible numbers
    //change the value of the possibleBools array
    
    var possibleBools = booleanArr(rowArr)
    possibleBools = possibleNumbers(rowArr, booleanArr: &possibleBools)
    possibleNumbers(columnArr, booleanArr: &possibleBools)
    possibleNumbers(square, booleanArr: &possibleBools)
    
    validNums = allPossibleNumbers(possibleBools)
    
    return validNums
}

getValidNumbers(sudokuArr, row: 4, col: 4)

var matrix =  [[1,2,3,4],
               [5,6,7,8],
               [9,0,1,2],
               [3,4,5,6]]

           [[3, 9, 5, 1],
            [4, 0, 6, 2],
            [5, 1, 7, 3],
            [6, 2, 8, 4]]


//grid[i][j] = grid[j][count-i-1]
[[4, 2, 3, 4],
 [5, 6, 7, 8],
 [9, 0, 1, 2],
 [1, 4, 5, 6]]


//grid[j][count-i-1] = grid[count-i-1][count-j-1]
[[4, 2, 3, 6],
 [5, 6, 7, 8],
 [9, 0, 1, 2],
 [1, 4, 5, 6]]

//grid[count-i-1][count-j-1] = grid[count-j-1][i]
[[4, 2, 3, 6],
 [5, 6, 7, 8],
 [9, 0, 1, 2],
 [1, 4, 5, 3]]

//grid[i][j] = grid[j][count-i-1]
//grid[j][count-i-1] = grid[count-i-1][count-j-1]
//grid[count-i-1][count-j-1] = grid[count-j-1][i]
//grid[count-j-1][i] = temp


func rotateMatrix90Degrees(inout grid: [[Int]]) ->[[Int]]
{
    var temp = Array(count: grid.count, repeatedValue: 0)
    var tempGrid = Array(count: grid.count, repeatedValue:temp)
    
    let count = grid.count
    
    for i in 0..<count {
        
        for j in 0..<count {
            
            tempGrid[i][j] = grid[count-1-j][i]
        }
        
        print("j: \(i)")
    }

    
    print("TempGrid: \(tempGrid)")
    print("grid: \(grid)")
    
    grid = tempGrid
    
    return grid
}

rotateMatrix90Degrees(&matrix)


//For printing the diagonal
func diagonal(inout outerArr: [[Int]]) ->[Int]
{
    var diagonalArr: [Int] = []
    
    for i in 0..<outerArr.count {
        
        diagonalArr.append(outerArr[i][i])
    }
    
    return diagonalArr
}

diagonal(&sudokuArr)

let A = 1
let B = 2
let C = 3
let D = 4
var fourElementArr = [D, A, C, B]

let E = 1
let F = 21
let G = 49
let H = 365
var anotherFourElementArr = [H, G, E, F]

func sortFourElements(inout arr:[Int]) ->[Int]
{
    let maxIndex = arr.count - 1
    let midIndex = maxIndex / 2
    
    for _ in midIndex...maxIndex {
        
        if arr[midIndex]<arr[midIndex-1] {
            
            (arr[midIndex], arr[midIndex-1])  = (arr[midIndex-1], arr[midIndex])
        }
        
        if arr[maxIndex] < arr[maxIndex-1] {
            
            (arr[maxIndex-1], arr[maxIndex])  = (arr[maxIndex], arr[maxIndex-1])
        }
        
        if arr[midIndex] > arr[maxIndex-1] {
            
            (arr[midIndex], arr[maxIndex-1])  = (arr[maxIndex-1], arr[midIndex])
        }
    }
    
    
    
    
    return arr
}

sortFourElements(&fourElementArr)
sortFourElements(&anotherFourElementArr)

let I = "Igloo"
let J = "Jam"
let K = "Kangaroo"
let L = "Live"
var fourStringArr = [I, L, K, J]

let M = "Monkey"
let N = "Neuron"
let O = "Ocean"
let P = "Platypus"
var anotherFourStringArr = [P, O, M, N]

func unicodeStringValue(str: String) ->Int
{
    
    let singleCharString = str as NSString
    let singleCharValue = Int(singleCharString.characterAtIndex(0))
    print("The value of \(singleCharString) is \(singleCharValue)")
    
    return singleCharValue
}


func sortFourStrings(inout arr:[String]) ->[String]
{
//    for str in arr {
//        
//        unicodeStringValue(str)
//    }
    
    let maxIndex = arr.count - 1
    let midIndex = maxIndex / 2
    
    for _ in midIndex...maxIndex {
        
        if arr[midIndex]<arr[midIndex-1] {
            
            (arr[midIndex], arr[midIndex-1])  = (arr[midIndex-1], arr[midIndex])
        }
        
        if arr[maxIndex] < arr[maxIndex-1] {
            
            (arr[maxIndex-1], arr[maxIndex])  = (arr[maxIndex], arr[maxIndex-1])
        }
        
        if arr[midIndex] > arr[maxIndex-1] {
            
            (arr[midIndex], arr[maxIndex-1])  = (arr[maxIndex-1], arr[midIndex])
        }
    }
    
    
    
    
    return arr
}

sortFourStrings(&fourStringArr)
sortFourStrings(&anotherFourStringArr)



//func getValidNumbersCameron(sudokuBoard:[[Int]], row:Int, col:Int) -> [Int]
//{
//
//    var valid: Set<Int> = [1,2,3,4,5,6,7,8,9]
//    
//    for c in 0..<sudokuBoard[row].count {
//        
//        if c == col {
//            
//            continue
//        }
//        
//        //if nil it will skip over
//        if let value = sudokuBoard[row][c]{
//        
//            valid.remove(value)
//        
//        }
//    }
//    
//    for r in 0..<sudokuBoard.count {
//        
//        if r == row {
//            
//            continue
//        }
//        
//        if let value = sudokuBoard[r][col] {
//            
//            valid.remove(value)
//        }
//    }
//    
//    let sqRow = row / 3
//    let sqCol = col / 3
//    
//    for r in sqRow..<(sqRow + 3) {
//        for c in sqCol..<(sqCol + 3) {
//            
//            if r == row && c == col {
//                
//                continue
//            }
//            
//            if let value = sudokuBoard[r][c]{
//                
//                valid.remove(value)
//            }
//        }
//        
//    }
//    
//    return Array<Int>(valid)
//}

func rotateMatrixAgain(matrix: [[Int]]) ->[[Int]]
{
    
    let n = matrix.count
    
    var result: [[Int]] = []
    
    for _ in 0..<matrix[0].count {
        
        var row: [Int] = []
        
        for _ in 0..<matrix.count {
            
            row.append(0)
        }
        result.append([])
    }
    
    //r, row gives you a tuple of the value and the index with enumerate
    for (r, row) in matrix.enumerate() {
        
        for c in 0..<row.count {
            
            result[c][matrix[0].count - r - 1] = row[c]
        }
    }
    
    
    
    //m x n matrix
    //0, 0 -> 0, n-1
    //  r, c -> r, n-c-1
    
    //0, n -> m-1, n-1
    //  r, c -> n-r-1, c
    
    //m-1, n-1 -> m-1, 0
    //  r, c -> n-r-1,
    
    //m-1, 0 -> 0, 0
    
    return result
}

//func mergeSort(values: [Int]) ->[Int] {
//    
//    var left = values [0...1]
//    
//    if left[0] > left[1] {
//        
//        let t = left[0]
//        left[0] = left[1]
//        left[1] = t
//    }
//    
//    var right = values [2...3]
//    
//    if right[0] > right[1] {
//        
//        let t = right[0]
//        right[0] = right[1]
//        right[1] = t
//    }
//
//    
//    
//}


//RECURSION

func fib(n: Int) -> Int
{
    if n < 2 {
        
        return 1
    }
    
    return fib(n - 2) + fib(n - 1)
}

let values = (0..<10).map { i in fib(i) }
values

fib(5)

/*

---------
fib(5)
a = 3
b = 4
---------
fib(3)
a = 1
b = 2
---------
fib(2)
a = 0
b = 1
---------
fib(0)1
---------

*/