//
//  Helper.m
//  SendGrid
//
//  Created by Kane on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "Helper.h"

@implementation Helper
{
    JASidePanelController* savedController;
}

+ (id)sharedInstance
{
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (void) addToolbar:(UIView*)view controller:(JASidePanelController*)controller;
{
    savedController = controller;
    CGRect frame = CGRectMake(0, 0, view.frame.size.width, 44);
    UIToolbar* toolBar = [[UIToolbar alloc] initWithFrame:frame];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    NSMutableArray *items = [[NSMutableArray alloc] init];
    UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-2.png"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(onToolbarButton1Click:)];
    [items addObject:button];
    [toolBar setItems:items];
    [view addSubview:toolBar];
}

- (void) onToolbarButton1Click:(id)sender
{
    [savedController showLeftPanelAnimated:true];
}

@end
