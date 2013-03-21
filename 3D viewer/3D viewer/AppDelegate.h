//
//  AppDelegate.h
//  3D viewer
//
//  Created by beingenious on 20/03/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
	UIWindow *_window;
	DViewController *_viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) DViewController *viewController;

@end