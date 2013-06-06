//
//  ProfileController.h
//  SendGrid
//
//  Created by Kane on 6/4/13.
//  Copyright (c) 2013 SendGrid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface ProfileController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableViewCell *addressCell;


@end
