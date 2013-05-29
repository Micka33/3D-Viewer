//
//  DetailViewController.h
//  Release
//
//  Created by beingenious on 4/5/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
