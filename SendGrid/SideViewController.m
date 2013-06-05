//
//  SideViewController.m
//  SendGrid
//
//  Created by Kien Pham on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "SideViewController.h"

@interface SideViewController ()

@end

@implementation SideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerController"]];
    [self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"rightController"]];
}
    

@end
