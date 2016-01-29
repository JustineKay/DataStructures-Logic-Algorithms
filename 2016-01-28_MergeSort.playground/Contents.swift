//: Playground - noun: a place where people can play

import UIKit

//*******MERGE SORT*********

func mergeSort(values: [Int]) -> [Int]
{
    
    //check length of values
    //return values if count is less than 2
    
    if values.count < 2{
        
        return values
    }
    
    // Split values into left and right (roughly equal size)
    
    //"Slice"
    var leftHalf = Array(values[0..<values.count/2])
    var rightHalf = Array(values[values.count/2..<values.count])
    
    //sort the left half
    
    leftHalf = mergeSort(leftHalf)

    
    //sort the right half
    
    rightHalf = mergeSort(rightHalf)
    

    //merge the two halves together
    //return the result
    
    return merge(withLeftArray: leftHalf , AndRight: rightHalf)
}

func merge(withLeftArray left: [Int], AndRight right: [Int]) ->[Int]
{
    
    var result = [Int]()
    
    //iterate over bothleft and right at the same time
    var i = 0
    var j = 0
    
    
    //compare pairs of values in left and right
    
    while i < left.count || j < right.count {
        
        //take the minimum of the two and add it to the result
        
        //if we've taken everything out of the right array
        //                  OR the value in the left array 
        //                     is less than the value in the right array
        if j >= right.count || left[i] < right[j] {
            
            //take left
            result.append(left[i])
            i += 1
            
        } else if j < right.count {
            
            //take right
            result.append(right[j])
            j += 1
        }
    }

    return result
}


func merge2(left: [Int], _ right: [Int]) ->[Int]
{
    
    var result = [Int]()
    
    //iterate over bothleft and right at the same time
    //GENERATORS
    var leftGen = left.generate()
    var rightGen = right.generate()

    var leftVal = leftGen.next()
    var rightVal = rightGen.next()
    
    //compare pairs of values in left and right
    
    while leftVal != nil || rightVal != nil {
        
        //take the minimum of the two and add it to the result
        
        //if we've taken everything out of the right array
        //                  OR the value in the left array
        //                     is less than the value in the right array
        
        if rightVal == nil {
            result.append(leftVal!)
            leftVal = leftGen.next()
            
        } else if leftVal == nil {
            
            result.append(rightVal!)
            rightVal = rightGen.next()
            
        } else {
            
            if leftVal < rightVal {
                
                //take left
                result.append(leftVal!)
                leftVal = leftGen.next()
                
            } else {
                
                //take right
                result.append(rightVal!)
                rightVal = rightGen.next()
                
            }
            
        }
        
    }
    
    return result
}


mergeSort([10,2,6,5])



func doSomething(arg: [Int]) {
    
    func helper(index: Int) {
        
        if index < arg.count {
            
            print(arg[index])
            helper(index + 1)
        }
    }
    helper(0)
}


//Print elements in an array
func printAllElements(values: [Int])
{
    
    for value in values {
        
        print(value)
    }
}

//Recursive
func printAllElementsRecursive(values: [Int])
{
    
    printElementsHelper(values, index: 0)
}


func printElementsHelper(values: [Int], index: Int)
{
    if index < values.count {
        print(values[index])
        printElementsHelper(values, index: index + 1)
    }
}

//make helper private
func printAllElementsRecursive2(values: [Int])
{
    func printElementsHelper(values: [Int], index: Int)
    {
        if index < values.count {
            
            print(values[index])
            printElementsHelper(values, index: index + 1)
        }
    }
    
    printElementsHelper(values, index: 0)
}


var values = [3, 6, 5, 2, 1, 10]
printAllElementsRecursive(values)
printAllElementsRecursive2(values)

func setValues(inout array: [Int], value: Int, atIndex index: Int)
{
    
    array[index] = value
}

var values2 = [10, 20 ,30]
setValues(&values2, value: 100, atIndex: 1)

func reverse(inout array: [Int])
{
    for i in 0..<array.count / 2 {
    
        swap(&array[i], &array[array.count - i - 1])
    }
//    for i in 0..<array.count {
//        
//        let t = array[i]
//        array[i] = array[array.count - i - 1]
//        array[array.count - i - 1] = t
//    }
}

reverse(&values2)


[3, 6, 5, 2, 1, 10]


let left = [3,6,5]

    let leftLeft = [3, 6]

        let leftLeftLeft = [3]
        let leftLeftRight = [6]

    let leftRight = [5]

    let leftmerged = [3, 5, 6]



let right = [2, 1, 10]

    let rightLeft = [2,1]

        let rightLeftLeft = [2]
        let rightLeftRight = [1]

    let rightLeftMerged = [1, 2]

    let rightRight = [10]

let rightMerged = [1, 2, 10]

[3, 5, 6]
[1, 2, 10]

