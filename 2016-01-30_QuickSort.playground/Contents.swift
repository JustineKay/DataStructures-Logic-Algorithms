//: Playground - noun: a place where people can play

import UIKit

func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    
    // base case
    if firstIdx >= lastIdx {
        
        return
    }
    
    // partition
    
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}


func quickSort(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    
    // set pivotValue to firstElement
    
    let pivot = arr[firstIdx]
    
    // set leftMark
    var leftMarker = firstIdx + 1
    print("LeftMarker: \(leftMarker)")
    
    // set rightMark
    var rightMarker = lastIdx
    print("RightMarker: \(rightMarker)")
    
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while rightMarker >= leftMarker {
        
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
            print("NewlySwappedArr: \(arr)")
            
        }
    }
 
    // set the correct value at the splitPoint
    // check that values are not the same
    if arr[rightMarker] != arr[firstIdx] {
     
        swap(&arr[rightMarker], &arr[firstIdx])
        print("kindaSortedArr: \(arr)")
        
    }
    
    return rightMarker  // return the splitPoint
}

var arr = [22, 59, 38, 93, 95, 0, 34, 58, 72, 15]
//partition(&arr, first: 0, last: arr.count-1)
quickSort(&arr)