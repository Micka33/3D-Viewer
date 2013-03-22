//
//  3DViewController.h
//  3D viewer
//
//  Created by beingenious on 20/03/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DViewController : UIViewController <NGLViewDelegate, UIGestureRecognizerDelegate>
{
@private
    NGLMesh *_DModel;
    CGPoint _translation;
    CGFloat _rotation;
    CGFloat _tmpLastRotation;
    CGFloat _scale;
    CGFloat _tmpLastScale;
	NGLCamera *_camera;
    UIPanGestureRecognizer *_panRecognizer;
    UIRotationGestureRecognizer *_rotationRecognizer;
    UIPinchGestureRecognizer *_pinchRecognizer;
}

@property (nonatomic, strong) NGLMesh *_DModel;
@property (nonatomic) CGPoint _translation;
@property (nonatomic) CGFloat _rotation;
@property (nonatomic) CGFloat _tmpLastRotation;
@property (nonatomic) CGFloat _scale;
@property (nonatomic) CGFloat _tmpLastScale;
@property (nonatomic, strong) NGLCamera *_camera;
@property (nonatomic, strong) UIPanGestureRecognizer *_panRecognizer;
@property (nonatomic, strong) UIPinchGestureRecognizer *_pinchRecognizer;
@property (nonatomic, strong) UIRotationGestureRecognizer *_rotationRecognizer;

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
        shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void)handlePinch:(UIPanGestureRecognizer *)recognizer;
- (void)handleRotation:(UIPanGestureRecognizer *)recognizer;
/*
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
*/
@end
