//
//  SGStatsModel.h
//  SendGrid
//
//  Created by Kien Pham on 6/6/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGStatsModel : NSObject

- (void)getStats:(void (^)(id result))success failure:(void (^)())failure;

@end
