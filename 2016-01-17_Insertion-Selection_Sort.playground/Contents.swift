//: Playground - noun: a place where people can play

import UIKit

//Space complexity is the amount of memory your algorithm takes to run

//INSERTION SORT

func insert(x: Int, var intoSortedList xs: [Int]) ->[Int]{
    
    var didInsertX = false
    
    for i in 0..<xs.count { //executes n times
        
        if x < xs[i] {
            
            xs.insert(x, atIndex:i) //executes n times
            
            didInsertX = true
            
            break
        }
    }
    
    if !didInsertX {
        
        xs.append(x)
    }
    
    return xs
}

//TIME O(n^2)
//SPACE O (1/2n) = O(n)

insert(3, intoSortedList: [1, 2, 4, 5])
insert(2, intoSortedList: [1, 2, 4, 5])



func insertionSort(xs: [Int]) -> [Int]{
    
    var sorted = [Int]()
    
    for x in xs { //n
        
        sorted = insert(x, intoSortedList: sorted) //executes n^2 times
    }
    
    return sorted
}

//TIME O(n^3)
//SPACE O(n * 1/2n) = O(n^2)

insertionSort([8, 6, 7, 5, 3, 0, 9])




/*
SELECTION SORT
Basic approach
Find the smallest item in the unsorted array
Move it to the front
Repeat until sorted
*/

//"Select" the smallest value

func select(xs: [Int], startingAt k: Int) -> Int
{
    var minIndex = k
    
    for i in k+1..<xs.count {
        
        if xs[i] < xs[minIndex] {
            
            //we found a new minimum
            minIndex = i
        }
    }
    
    return minIndex
}

select([0, 1, 2, 3, 9, 5, 4, 6], startingAt: 4)
select([8, 6, 7, 5, 3, 0, 9], startingAt: 0)
select([0, 6, 7, 5, 3, 8, 9], startingAt: 0)
select([5, 6, 7, 5, 3, 8, 0], startingAt: 0)


func selectionSort(inout xs: [Int]) ->[Int] {
    
    for sorted in 0..<xs.count {
        
        let minIndex = select(xs, startingAt: sorted)
        
        (xs[sorted], xs[minIndex]) = (xs[sorted], xs[minIndex])
    }
    
    return xs
}

var xs = [8, 6, 7, 5, 3, 0, 9]
selectionSort(&xs)

//TIME O(n^2)
//SPACE O(n)


//Quick sort trick:
var x = 3
var y = 5

(x, y) = (y, x)
x
y



//BUCKET/RADIX SORT
/*Basic approach
Divide the list into a set of buckets, one for each character
Subdivide each bucket with the same technique until the bucket just contains one string
Combine the buckets in order
*/

