//
//  FoursquareManager.m
//  W4D5-FoursquareGCD
//
//  Created by Daniel Mathews on 2015-05-28.
//  Copyright (c) 2015 ca.lighthouselabs. All rights reserved.
//

#import "FoursquareManager.h"

@implementation FoursquareManager

+ (void)responseFrom4sq:(CLLocation*)currentLocation limit:(NSString*)limit block:(void (^)(NSArray *locationArray, NSError *error))completionBlock{

    NSString *apiString4aq= @"https://api.foursquare.com/v2/venues/search?ll=";
    NSString *clientID = @"&client_id=G43T0S0CZPUGJNADIXGYHFG1QD41WP3YZDTR2SB4O0FKOPLN&client_secret=GO3N53AZYECOIIJLQXM5YGRJGNSZ4ALPZN4QYQRXPCBEEJQW";
    NSString *version = @"&v=20121219";
    
    NSMutableURLRequest *foursqRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%1.6f,%1.6f%@%@&limit=%@",apiString4aq,currentLocation.coordinate.latitude,currentLocation.coordinate.longitude,clientID,version,limit]]];
    
    dispatch_queue_t foursqQueue;
    foursqQueue = dispatch_queue_create("com.thePlayApp.foursqQueue", NULL);
    dispatch_async(foursqQueue, ^{
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSError *error2 = nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:foursqRequest
                                             returningResponse:&response
                                                         error:&error];
        if(!error){
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&error2];
            
            if (!error2) {
                
                NSLog(@"4sq data retrieved successfully");
                
                NSDictionary *dataDictionary4sq = [json objectForKey:@"response"];
                NSArray *venueArray = [dataDictionary4sq objectForKey:@"venues"];
                
                completionBlock(venueArray,error);
                
            }else{
                completionBlock([NSArray array] ,error);
                NSLog(@"4sq data not retrieved successfully :(");
            }
        }else{
            completionBlock([NSArray array] ,error);
            NSLog(@"4sq data not retrieved successfully :(");
        }
        
    });
}

@end
