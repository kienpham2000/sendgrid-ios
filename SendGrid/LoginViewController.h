//
//  LoginViewController.h
//  SendGrid
//
//  Created by Kien Pham on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property(strong) IBOutlet UITextField* usernameField;
@property(strong) IBOutlet UITextField* passwordField;

- (IBAction)onLoginButtonClick:(id)sender;

@end
