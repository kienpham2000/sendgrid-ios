//
//  SGProfileModel.h
//  SendGrid
//
//  Created by Kien Pham on 6/5/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGProfileModel : NSObject



- (void)getProfile:(void (^)(id result))success failure:(void (^)())failure;

@end
