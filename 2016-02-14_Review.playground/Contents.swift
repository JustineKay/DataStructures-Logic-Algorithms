//: Playground - noun: a place where people can play

import UIKit

//***********Big O*************

func problemA(a: [Int],b: [Int])->Bool{
    for aNumber in a{				//n
        for bNumber in b{			//n * n
            if aNumber == bNumber{
                return true
            }
        }
    }
    return false
}							//O(n^2)


func problemB(a:Int)->Int{
    if a<=1{
        return 1
    }
    return a * problemB(a-1)			//n
    
}
//O(n)

problemB(5)



func problemC(a:[String])->Bool{
    for x in 0..<1000{				//constant because we know the
        if a[x] ==  "pineapple" {		//number of times we’re looping
            return true
        }
    }
    return false
}
//O(1) constant



//assume that .sort() is an O(nlog(n)) algorithm
func problemD(a: [[Int]])->Int{
    var newLists = [[Int]]()
    var counter = 0
    for element in a {				//n
        let sortedElement = element.sort()	//n * nlog(n)
        newLists.append(sortedElement)
    }
    for sortedElement in newLists{			//n
        if sortedElement[0] <= 5{
            counter += 1
        }
    }
    return counter
}
//O(n^2 log(n))


//*******The opposite of log(n)*************
func problemE(i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return problemE(i - 1) + problemE(i - 2) //2^n
    }
}
//O(2^n)
//each recursive call in this function doubles itself


func problemF(sortedArr:[Int],key:Int)->Bool{
    
    if sortedArr[0] == key || sortedArr[sortedArr.count - 1] == key {
        
        return true
        
    }
    
    var left = 0
    var right = sortedArr.count - 1
    
    
    while(left <= right){			//O(n)
        let mid = (left+right)/2
        let value = sortedArr[mid]
        
        if value == key {
            return true
        }
        
        if (value < key){
            left = mid + 1
        }
        if (value > key){
            right = mid - 1
        }
    }
    return false
}

let a = [2, 4, 7, 9, 12, 16]
problemF(a, key: 16)




//******** FIZZ BUZZ *********

//with an "anonymuous" switch statement

func fizzBuzz() {
    
    var counter = 100
    
    while counter > 0 {
        
        switch counter {
            
        case _ where counter % 15 == 0 :
            
            print("FIZZ-BUZZ")
            
        case _ where counter % 5 == 0 :
            
            print("BUZZ")
            
        case _ where counter % 3 == 0 :
            
            print("FIZZ")
            
        default:
            print(counter)
        }
        
        counter -= 1
    }
}

fizzBuzz()


//with tuples

func fizzBuzzTuples() {
    
    for num in 1...100 {
    
        let result = (num % 3, num % 5)
        
        switch result {
            
        case (0,0) :
            print("FIZZ-BUZZ")
            
        case (_,0) :
            
            print("BUZZ")
            
        case (0,_) :
            
            print("FIZZ")
            
        default :
            
            print(num)
        }
        
    }
}

fizzBuzzTuples()



func arrOf100() -> [Int]{

    var counter = 1
    var arr = [Int]()
    
    for _ in 1...100 {
        
        arr.append(counter)
        counter += 1
    }
    return arr
}

var arr = arrOf100()