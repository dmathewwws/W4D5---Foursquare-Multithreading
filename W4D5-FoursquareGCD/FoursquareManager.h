//
//  FoursquareManager.h
//  W4D5-FoursquareGCD
//
//  Created by Daniel Mathews on 2015-05-28.
//  Copyright (c) 2015 ca.lighthouselabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface FoursquareManager : NSObject

+ (void)responseFrom4sq:(CLLocation*)currentLocation limit:(NSString*)limit block:(void (^)(NSArray *locationArray, NSError *error))completionBlock;

@end
