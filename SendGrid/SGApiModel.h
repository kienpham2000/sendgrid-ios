//
//  SGApiModel.h
//  SendGrid
//
//  Created by Kien Pham on 6/5/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"

@interface SGApiModel : NSObject

- (void)makeRequestWithAction:(NSString*)action
                    andParams:(NSDictionary*)params
                    success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                    failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;

@end
