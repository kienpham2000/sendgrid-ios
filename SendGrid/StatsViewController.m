//
//  StatsViewController.m
//  SendGrid
//
//  Created by Kien Pham on 6/6/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "StatsViewController.h"
#import "Helper.h"
#import "SGStatsModel.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

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

    SGStatsModel* statsModel = [[SGStatsModel alloc] init];
    UIActivityIndicatorView* indicator = [Helper createActivityIndicatorForView:self.view];
    
    NSLog(@"here before result");
    
    [statsModel getStats:^(id result) {
        [indicator stopAnimating];
        NSLog(@"stats: %@", result);
        
        NSMutableDictionary *resultClean = [[NSMutableDictionary alloc] initWithDictionary:result[0]];
        
        self.statsLabel.text = [NSString stringWithFormat:@"%@", resultClean[@"date"]];
        

        self.scrollView.hidden = NO;
        
    } failure:nil];

}

- (IBAction)onSelectDateRange:(id)sender
{
//    LoginModel* lm = [LoginModel sharedInstance];
//    NSString* username = self.usernameField.text;
//    NSString* password = self.passwordField.text;
//    
//    [lm authenticateWithUsername:username andPassword:password];
    NSLog(@"clicked on Date Range");
    
    // We want to open the date range selector view:
    // statsDateRangeViewController
    [self dismissViewControllerAnimated:true completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
