//
//  ViewController.m
//  SendGrid
//
//  Created by Kien Pham on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "ViewController.h"
#import "LoginModel.h"
#import "LoginViewController.h"
#import "Helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[Helper sharedInstance] addToolbar:self.view controller:self.sidePanelController];
    });

    LoginModel* lm = [LoginModel sharedInstance];
    if (!lm.isAuthenticated) {
        LoginViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [lvc viewDidLoad];
        [self presentViewController:lvc animated:true completion:^{

        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action Handlers
- (IBAction)onLeftMenuButtonClick:(id)sender
{
    [self.sidePanelController showLeftPanelAnimated:true];
}

@end
