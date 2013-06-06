//
//  ProfileController.m
//  SendGrid
//
//  Created by Kane on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import "ProfileController.h"
#import "Helper.h"
#import "SGProfileModel.h"

@interface ProfileController ()

@end

@implementation ProfileController

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
    self.scrollView.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[Helper sharedInstance] addToolbar:self.view controller:self.sidePanelController];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action Handlers
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue: %@", segue);
    SGProfileModel* profileModel = [[SGProfileModel alloc] init];
    UIActivityIndicatorView* indicator = [Helper createActivityIndicatorForView:self.view];
    [profileModel getProfile:^(id result) {
        NSMutableDictionary *resultClean = [[NSMutableDictionary alloc] initWithDictionary:result[0]];
        
        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", resultClean[@"first_name"], resultClean[@"last_name"]];

        self.usernameLabel.text = [NSString stringWithFormat:@"%@", resultClean[@"username"]];
        
        [indicator stopAnimating];
        self.scrollView.hidden = NO;
        UIView* view = ((UIViewController*)segue.destinationViewController).view;
        NSArray* cellData = @[@"", @"email", @"phone", @"website", @"address"];
        resultClean[@"address"] = [NSString stringWithFormat:@"%@\n%@\n%@, %@ %@",resultClean[@"address"], resultClean[@"address2"], resultClean[@"city"], resultClean[@"state"], resultClean[@"zip"]];
        
        for (int i = 1; i < [cellData count]; i++) {
            UITableViewCell* cell = (UITableViewCell*)[view viewWithTag:i];
            cell.detailTextLabel.text = resultClean[cellData[i]];
            if (i == 4) {
                CGRect frame = cell.detailTextLabel.frame;
                CGSize constraint = CGSizeMake(frame.size.width, 20000.0f);
                CGSize size = [cell.detailTextLabel.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
                NSLog(@"height: %f", size.height);
                frame.size.height = MAX(size.height, 19.0f);
                cell.detailTextLabel.frame = frame;
                frame = cell.frame;
                frame.size.height = MAX(size.height, 19.0f) + 27;
                cell.frame = frame;
                [cell layoutSubviews];
            }
        }
    } failure:nil];
    
}


@end
