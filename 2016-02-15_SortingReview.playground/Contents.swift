//: Playground - noun: a place where people can play

import UIKit

/*

Quick Sort Vs. Merge Sort
A comparison.

*/


//Quick Sort
func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    
    //BASE CASE - return from func if first index is greater than or equal to last index
    
    //HELPER - *sort* and return new split point
    // *** Helper function *** Partition! - create a variable to hold the splitPoint
    
    //TWO RECURSIVE CALLS - sort and return for each half of the same newly sorted arr
    // quickSort the leftHalf of arr using the first Index and the splitPoint - 1
    // quickSort the rightHalf of arr using the splitPoint + 1 and the last index

}

//Merge Sort
func mergeSort(values: [Int]) -> [Int]
{
    
    //BASE CASE - return values if count is less than 2
    
    
    //SPLIT - array into two halves
    //store leftHalf of valuesArray - values[0..<values.count/2]
    //store rightHalf of valuesArray - values[values.count/2..<values.count]
    
    
    //TWO RECURSIVE CALLS - on each half
    //make a recursive call on the left half and store it right back in leftHalf
    //make a recursive call on the rightHalf and store it right back in rightHalf
    
    
    //HELPER - merge both halves, return result
    //*** Helper Function *** return the helper function: merge both halves
    
    
    
    return []//this is just placeholder for this example
    
}




//Quick Sort Partition helper func
func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    
    //create a let to hold the pivotValue equal to the first element - arr[firstIdx]
    
    
    // create a var to hold the leftMark - firstIdx + 1
    
    
    // create a var to hold the rightMark - lastIdx
    
    
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    
    //WHILE RIGHTMark is GREATER than or equal to LeftMark
    
            //WHILE the value at LEFTMark is LESS than pivot
    
                //increment leftMark by 1
    
            //complete loop
    
    
            //WHILE the value at RIGHTMark is GREATER than pivot
    
                //decrement rightMark
    
            //complete loop
    
    
            //if rightMark is greater than leftMark
    
                //swap the values at rightMark & leftMark
    
    
    //complete while loop
    
    
    //If the value at rightMark does not equal the value at the firstIdx
    
            //FINAL SWAP the values at rightMark & the firstIdx
    
    
    //RETURN the rightMark, becuase it will be right in the middle of the smallest values and the largest values
    
    return 0  // Just for example
}




//Merge Sort FINAL Merge Helper Func
func merge(left: [Int], right: [Int]) ->[Int]
{
    //create a var to return the final sorted array - "result"
   
    //create two vars to iterate over both the left and right at the same time
    //i & j
    
    
    //WHILE i is less than left.count OR j is less than right.count
    
    
        //***IF*** j is greater than or equal to right.count
        //*OR* 
        //The value in left[i] is less than the value in right[j]
    
            //add the value of left[i] to result array
            
            //increment i by one
            
        //***ELSE IF*** j is LESS than right.count
            
            //add the value of right[j] to the result array
    
            //increment j by one
    
    
    //complete while loop
    
    return [] // just empty for this example
}
