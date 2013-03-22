//
//  MainViewController.h
//  3D viewer
//
//  Created by beingenious on 20/03/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DViewController.h"

@interface MainViewController : UIViewController
{
@private
    DViewController *_dViewController;
}

@property (nonatomic, strong) IBOutlet UIView *_containerView;

@end
