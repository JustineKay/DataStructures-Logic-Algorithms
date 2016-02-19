//
//  APIManager.h
//  2016-02-18_iOS-Review
//
//  Created by Justine Gartner on 2/18/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface APIManager : NSObject

+ (void) getLatestISSLocationWithCompletionHandler:(void(^)(CLLocationCoordinate2D coords))completion;

@end
