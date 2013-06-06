//
//  SGApiModel.m
//  SendGrid
//
//  Created by Kien Pham on 6/5/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "SGApiModel.h"
#import "LoginModel.h"

@implementation SGApiModel

// helper function: get the string form of any object
static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

// helper function: get the url encoded string form of any object
static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

- (void)makeRequestWithAction:(NSString*)action
                    andParams:(NSDictionary*)params
                      success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                      failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
{
    LoginModel* lm = [LoginModel sharedInstance];
    NSMutableDictionary* urlParams = [[NSMutableDictionary alloc] initWithDictionary:params];
    urlParams[@"api_user"] = lm.username;
    urlParams[@"api_key"] = lm.password;
    
    NSMutableArray *parts = [NSMutableArray array];
    
    for (id key in urlParams) {
        id value = [urlParams objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
   
    NSString* paramString = [parts componentsJoinedByString: @"&"];
    NSString* urlString = [NSString stringWithFormat:@"https://sendgrid.com/api/%@?%@", action, paramString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:success failure:failure];
    [operation start];
}

@end
