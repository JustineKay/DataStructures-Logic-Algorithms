//
//  main.m
//  InClassWork_2016-01-16
//
//  Created by Justine Gartner on 1/16/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //int[][];
        
        
        NSArray *innerArr1 = @[@1, @2, @3, @4, @5, @6
                              ];
        NSArray *innerArr2 = @[@7, @8, @9, @10, @11, @12
                               ];
        NSArray *innerArr3 = @[@13, @14, @15, @16, @17, @18
                               ];
        
        NSArray *arr = @[innerArr1, innerArr2, innerArr3];
        
        for (NSArray *innerArr in arr) {
            
            //NSLog(@"%@", innerArr);
            
            for (NSNumber *num in innerArr) {
                
                NSLog(@"%@", num);
            
            }
        }
        
        for (int i = 0; i < arr.count; i++) {
            
            //NSLog(@"%@", arr[i]);
            
            NSArray *innerArr = arr[i];
            
            for (int j = 0; j < innerArr.count; j++) {
                
                NSLog(@"%@", innerArr[j]);
                
            }
            
        }
        
        for (int i = 0; i < arr.count; i++) {
            
            //NSLog(@"%@", arr[i]);
            
            NSArray *innerArr = arr[i];
            
            for (int j = 0; j < innerArr.count; j++) {
                
                NSLog(@"%@", innerArr[j]);
                
            }
            
        }
    
    }
    return 0;
}
