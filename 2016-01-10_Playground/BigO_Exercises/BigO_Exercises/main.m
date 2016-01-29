//
//  main.m
//  BigO_Exercises
//
//  Created by Justine Gartner on 1/10/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL hasDuplicates(int xs[], int n) {
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            if (i != j && xs[i] == xs[j]) {
                return YES;
            }
        }
    }
    return NO;
}

int main() {
    // Try 100 different values of n
    for (int n = 0; n < 10000; n += 100) {
        
        // Generate some data to supply to the method
        int data[n];
        for (int i = 0; i < n; i++) {
            data[i] = i;
        }
        
        NSDate *methodStart = [NSDate date];
        // *** START
        
        // Call the method you want to profile
        hasDuplicates(data, n);
        
        // *** END
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime =
        [methodFinish timeIntervalSinceDate:methodStart];
        printf("%f\n", executionTime);
    }
    
    int n = 24;
    int xs[5] = {2, 3, 45, 1, 78};
    
    for (int i = 0; i < n; i++) {
        
        printf("Inside first loop\n\n");
        
        for (int j = 0; j < 10; j++) {
            
            printf("Inside second loop\n\n");
            
            for (int k = n - 1; k >= 0; k--) {
                
                xs[j * i] = xs[k];
                
                printf("Inside third loop\n\n");
                
                //what's happening here
                int jI = j * i;
                printf("xs[j * i], j = %d\n",j);
                printf("xs[j * i], i = %d\n",i);
                printf("xs[j * i] = xs [%d]\n",jI);
                printf("k = %d, xs[%d]\n",k, k);
                
                
            }
        }
    }

    
    return 0;
}


/*
 Use the method above in a new command line project to actually compute the time it takes to perform some of the algorithms we talked about. Here’s the version for our hasDuplicates method. Keep in mind that some of our algorithms will perform differently based on the data generated. You might also need to increase or decrease the upper bound and step size for n to get meaningful results in a timely manner.

Copy and paste the console output of this program into your favorite spreadsheet app and graph the results. Do they match your expectations based on the big O of that method?
 
If you have time, try running a regression using the LINEST function or the trendline tool (google for help on using those in your spreadsheet app).
*/