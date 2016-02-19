//
//  APIManager.m
//  2016-02-18_iOS-Review
//
//  Created by Justine Gartner on 2/18/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIManager

+ (void) getLatestISSLocationWithCompletionHandler:(void(^)(CLLocationCoordinate2D coords))completion
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager GET:@"http://api.open-notify.org/iss-now.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSLog(@"Response Object: %@", responseObject);
        
        NSDictionary *position = [responseObject objectForKey:@"iss_position"];
        double latitude = [position[@"latitude"]doubleValue];
        double longitude = [position [@"longitude"]doubleValue];
        
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
        
        completion(location);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        
        
        NSLog(@"ERROR: %@", error);
    }];
    
}

@end
