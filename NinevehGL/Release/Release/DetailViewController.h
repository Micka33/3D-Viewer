//
//  DetailViewController.h
//  Release
//
//  Created by beingenious on 4/5/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, NGLViewDelegate, UIGestureRecognizerDelegate>
{
/*
 @private
    NGLMesh *DModel;
    CGPoint panRotation;
    CGPoint panTranslation;
    CGFloat rotation;
    CGFloat tmpLastRotation;
    CGFloat scale;
    CGFloat tmpLastScale;
	NGLCamera *camera;
    UIPanGestureRecognizer *panRecognizer;
    UIPanGestureRecognizer *panRecognizerDouble;
    UIRotationGestureRecognizer *rotationRecognizer;
    UIPinchGestureRecognizer *pinchRecognizer;
*/
}


@property (nonatomic, strong) NGLMesh *DModel;
@property (nonatomic) CGPoint panTranslation;
@property (nonatomic) CGPoint panRotation;
@property (nonatomic) CGFloat rotation;
@property (nonatomic) CGFloat tmpLastRotation;
@property (nonatomic) CGFloat scale;
@property (nonatomic) CGFloat tmpLastScale;
@property (nonatomic, strong) NGLCamera *camera;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizerDouble;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchRecognizer;
@property (nonatomic, strong) UIRotationGestureRecognizer *rotationRecognizer;
@property (nonatomic, strong) NSDictionary *settings;

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void)handleDoublePan:(UIPanGestureRecognizer *)recognizer;
- (void)handlePinch:(UIPanGestureRecognizer *)recognizer;
- (void)handleRotation:(UIPanGestureRecognizer *)recognizer;

- (void)loadNewObject:(NSString*)ObjectName;
@end
