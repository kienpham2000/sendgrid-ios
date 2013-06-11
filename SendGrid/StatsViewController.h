//
//  StatsViewController.h
//  SendGrid
//
//  Created by Kien Pham on 6/6/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface StatsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *statsLabel;
//@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableViewCell *addressCell;

- (IBAction)onSelectDateRange:(id)sender;

@end

