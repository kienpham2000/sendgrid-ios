//
//  SGStatsModel.m
//  SendGrid
//
//  Created by Kien Pham on 6/6/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "SGStatsModel.h"
#import "SGApiModel.h"

@implementation SGStatsModel

- (void)getStats:(void (^)(id result))success failure:(void (^)())failure
{
//    NSDictionary *params = @{"days": 2};
    SGApiModel* api = [[SGApiModel alloc] init];
    
    [api makeRequestWithAction:@"stats.get.json" andParams:nil
                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                           success(JSON);
                       }
                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                           failure();
                       }];
}

@end
