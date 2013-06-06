//
//  Helper.h
//  SendGrid
//
//  Created by Kane on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JASidePanelController.h"

@interface Helper : NSObject

+ (id)sharedInstance;

- (void) addToolbar:(UIView*)view controller:(JASidePanelController*)controller;
- (void) onToolbarButton1Click:(id)sender;

+ (UIActivityIndicatorView*) createActivityIndicatorForView:(UIView*)view;

@end
