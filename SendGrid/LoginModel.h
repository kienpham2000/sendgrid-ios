//
//  LoginModel.h
//  SendGrid
//
//  Created by Kien Pham on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

@property(copy)NSString* username;
@property(copy)NSString* password;

+ (id)sharedInstance;

- (Boolean)isAuthenticated;
- (Boolean)authenticateWithUsername:(NSString*)username andPassword:(NSString*)password;

@end
