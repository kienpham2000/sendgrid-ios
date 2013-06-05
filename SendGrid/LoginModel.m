//
//  LoginModel.m
//  SendGrid
//
//  Created by Kien Pham on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (id)sharedInstance
{
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    self.username = nil;
    self.password = nil;
    return self;
}

- (Boolean)isAuthenticated
{
    // TODO: https://sendgrid.com/api/profile.get.json?api_user=youremail@domain.com&api_key=secureSecret
    return self.username != nil && self.password != nil;
}

- (Boolean)authenticateWithUsername:(NSString*)username andPassword:(NSString*)password
{
    self.username = username;
    self.password = password;
    return true;
}

@end
