//
//  SGProfileModel.m
//  SendGrid
//
//  Created by Kien Pham on 6/5/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "SGProfileModel.h"
#import "SGApiModel.h"

@implementation SGProfileModel

- (void)getProfile:(void (^)(id result))success failure:(void (^)())failure
{
    SGApiModel* api = [[SGApiModel alloc] init];
    
    [api makeRequestWithAction:@"profile.get.json" andParams:nil
      success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        success(JSON);
    }
      failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        failure();
    }];
}

@end
