//
//  MainViewController.m
//  3D viewer
//
//  Created by beingenious on 20/03/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize _containerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self doInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self doInit];
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard-iPad" bundle:nil];
    _dViewController = (DViewController *)[storyboard instantiateViewControllerWithIdentifier:@"dViewController"];
    //_dViewController = [DViewController alloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_containerView addSubview:_dViewController.view];
    [_dViewController didMoveToParentViewController:self];
    [self addChildViewController:_dViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
