//
//  MasterViewController.h
//  Release
//
//  Created by beingenious on 4/5/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
