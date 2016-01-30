//: Playground - noun: a place where people can play

import UIKit

func quickSort(inout arr: [Int], first: Int, last: Int) {
    
    // base case
    
    
    // partition
    // quickSort on leftHalf
    // quickSort on rightHalf
}


func quickSort(inout arr: [Int]) {
    quickSort(&arr, first: 0, last: arr.count-1)
}

func partition(inout arr: [Int], first: Int, last: Int) -> Int {
    
    // set pivotValue to firstElement
    
    let pivot = arr[0]
    
    // set leftMark
    var leftMarker = first + 1
    print("LeftMarker: \(leftMarker)")
    
    // set rightMark
    var rightMarker = last
    print("RightMarker: \(rightMarker)")
    
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while rightMarker > leftMarker {
        
//        print("LeftMarker: \(leftMarker)")
//        print("RightMarker: \(rightMarker)")
        
        while arr[leftMarker] < pivot {
            
            leftMarker += 1
            print("LeftMarker: \(leftMarker)")
        }
        
        while arr[rightMarker] > pivot {
            
            rightMarker -= 1
            print("RightMarker: \(rightMarker)")
            
        }
        
        if rightMarker > leftMarker {
            
            swap(&arr[rightMarker], &arr[leftMarker])
            print("SWAP: \(arr[rightMarker], arr[leftMarker])")
            
        }
    }
 
    // set the correct value at the splitPoint
    swap(&arr[rightMarker], &arr[first])
    print("kindaSortedArr: \(arr)")
    
    return rightMarker  // return the splitPoint
}

var arr = [22, 59, 38, 93, 95, 0, 34, 58, 72, 15]
partition(&arr, first: 0, last: arr.count-1)
