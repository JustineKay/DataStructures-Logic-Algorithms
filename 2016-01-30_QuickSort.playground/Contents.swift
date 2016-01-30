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



//************Create a STACK**************

struct Stack<T> {
    
    var items: [T]
    
    //push
    mutating func push(element: T) {
        items.append(element)
    }
    
    //pop
    mutating func pop() -> T? {
        
        if items.count == 0 {
            
            return nil
        }
        
        return items.removeLast()
    }
    
    //peek
    func peek() -> T? {
        
        return items.last
    }
    
    //size
    func size() -> Int {
        
        return items.count
    }

    //Computed property
//    var size: Int {
//        
//        return items.count
//    }
}

//************Create a QUEUE**********

struct Queue<T> {
    var items: [T]
    
    //enqueue
    mutating func enqueue(element: T) {
        
        items.append(element)
    }
    
    //dequeue
    mutating func dequeue() -> T? {
        
        if items.count == 0 {
            
            return nil
        }
        
        return items.removeFirst()
    }
    
    //size
    func size() -> Int {
        
        return items.count
    }
}



//*********Create a STACK from a QUEUE************

struct QueueStack<T> {
    
    var items: Queue<T>
    
    //push
    mutating func push(element: T) {
        items.enqueue(element)
    }
    
    //pop
    mutating func pop() -> T? {
        
        if items.size() <= 0 {
            
            return nil
        }
        
        for _ in 0..<items.size()-1 {
            
            let x = items.dequeue()
            items.enqueue(x!)
        }
        
        return items.dequeue()
    }
    
    //peek
    mutating func peek() -> T? {
        
        if items.size() <= 0 {return nil}
        for _ in 0..<items.size()-1 {
            
            let x = items.dequeue()
            items.enqueue(x!)
        }
        
        let peek = items.dequeue()
        items.enqueue(peek!)

        return peek
    }
    
    //size
    func size() -> Int {
        
        return items.size()
    }
    
}


//***************EXERCISES*****************

/*Implement quicksort with the median pivot selection technique.
    - write median pivot selection function
    - swap with first element
    - run quicksort!
*/


func quickSortWithMedianPivot(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    
    // base case
    if firstIdx >= lastIdx {
        
        return
    }
    
    if lastIdx - firstIdx > lastIdx {
        
        findMedian(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
        
    }
    
    // partition
    
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}


func findMedian(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> [Int] {
    
    let firstPoint = arr[firstIdx]
    let lastPoint = arr[lastIdx]
    let midPoint = arr[arr.count / 2]
    
    var medianArr = [firstPoint, lastPoint, midPoint]
    
    for i in 0..<medianArr.count-1 {
        
        if medianArr[i] < medianArr[i + 1] {
            
            swap(&medianArr[i], &medianArr[i + 1])
        }
        
        if medianArr[i] > medianArr[medianArr.count-1] {
            
            swap(&medianArr[i], &medianArr[medianArr.count-1])
            
        }
        
    }
    
    let median = medianArr[1]
    print("median: \(median)")
    
    if median == arr[lastIdx]{
        
        swap(&arr[firstIdx], &arr[lastIdx])
        
    }else if median == arr[arr.count/2]{
        
        swap(&arr[arr.count/2], &arr[firstIdx])
    }
    
    
    return arr
}

var arr2 = [22, 59, 38, 93, 95, 0, 34, 58, 72, 15]
//findMedian(&arr2, firstIdx: 0, lastIdx: arr2.count-1)

func quickSortWithMedian(inout arr: [Int]) {
    quickSortWithMedianPivot(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

quickSortWithMedian(&arr2)

//***********Median and Insertion Sort***************
/*
Add in the code to run insertion sort when the length of the subarray is less than 10
*/

func quickSortWithMedianAndInsertion(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    
    // base case
    if firstIdx >= lastIdx {
        
        return
    }
    
    if arr.count > 10 {
        
        findMedian(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
        
    }else {
        
        //use insertion sort
    }
    
    // partition
    
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}


func insertionSort(inout values: [Int])
{
    
    func insertHelper(inout values: [Int], index: Int) {
        
        if index < values.count - 1 {
            
            let lastIndex = values.removeLast()
            print("last index: \(lastIndex)")
            
            if lastIndex < values[index] {
                
                values.insert(lastIndex, atIndex: index)
                print("newValues: \(values)")
                
                insertHelper(&values, index: 0)
                
            }else {
                
                values.append(lastIndex)
                insertHelper(&values, index: index + 1)
            }
            
            
        }
    }
    
    insertHelper(&values, index: 0)
    
}


