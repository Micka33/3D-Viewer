/**
 *  _D_viewerLayer.m
 *  3D viewer
 *
 *  Created by beingenious on 25/03/13.
 *  Copyright __MyCompanyName__ 2013. All rights reserved.
 */

#import "_D_viewerLayer.h"
#import "_D_viewerScene.h"


@interface _D_viewerLayer (TemplateMethods)
@property(nonatomic, readonly) _D_viewerScene* scene;
@end


@implementation _D_viewerLayer


/**
 * Returns the contained CC3Scene, cast into the appropriate type.
 * This is a convenience method to perform automatic casting.
 */
-(_D_viewerScene*) scene { return (_D_viewerScene*) cc3Scene; }



-(void) dealloc {
    [super dealloc];
}

/**
 * Override to set up your 2D controls and other initial state, and to initialize update processing.
 *
 * For more info, read the notes of this method on CC3Layer.
 */
-(void) initializeControls {
	[self scheduleUpdate];
}


#pragma mark Updating layer

/**
 * Override to perform set-up activity prior to the scene being opened
 * on the view, such as adding gesture recognizers.
 *
 * For more info, read the notes of this method on CC3Layer.
 */
-(void) onOpenCC3Layer
{
    // Register for double-finger dragging to pan the camera.
    UIPinchGestureRecognizer* cameraMover = [[UIPinchGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(handleCameraMove:)];
    [self cc3AddGestureRecognizer: cameraMover];
    [cameraMover release];

    // Register for double-finger rotation gesture to the camera.
    UIRotationGestureRecognizer* cameraRotateZ = [[UIRotationGestureRecognizer alloc]
                                                 initWithTarget: self action: @selector(handleCameraRotateOnZAxis:)];
    [self cc3AddGestureRecognizer: cameraRotateZ];
    [cameraRotateZ release];
    
    UIPanGestureRecognizer *cameraRotateXY = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleCameraRotateOnXYAxis:)];
    [cameraRotateXY setMinimumNumberOfTouches:1];
    [cameraRotateXY setMaximumNumberOfTouches:1];
    [self cc3AddGestureRecognizer: cameraRotateXY];
    [cameraRotateXY release];
}
/**
 * Override to perform tear-down activity prior to the scene disappearing.
 *
 * For more info, read the notes of this method on CC3Layer.
 */
-(void) onCloseCC3Layer {}

/**
 * The ccTouchMoved:withEvent: method is optional for the <CCTouchDelegateProtocol>.
 * The event dispatcher will not dispatch events for which there is no method
 * implementation. Since the touch-move events are both voluminous and seldom used,
 * the implementation of ccTouchMoved:withEvent: has been left out of the default
 * CC3Layer implementation. To receive and handle touch-move events for object
 * picking, uncomment the following method implementation.
 */
/*
-(void) ccTouchMoved: (UITouch *)touch withEvent: (UIEvent *)event {
	[self handleTouch: touch ofType: kCCTouchMoved];
}
*/

/**
 * This handler is invoked when a pinch gesture is recognized.
 *
 * If the pinch starts within a descendant CCNode that wants to capture the touch,
 * such as a menu or button, the gesture is cancelled.
 *
 * The CC3Scene marks the camera location when pinching begins, and is notified
 * as pinching proceeds. It uses the relative scale of the pinch gesture to determine
 * a new location for the camera. Finally, the scene is notified when the pinching
 * gesture finishes.
 *
 * Note that the pinching does not zoom the camera, although the visual effect is
 * very similar. For this application, moving the camera is more flexible and useful
 * than zooming. But other application might prefer to use the pinch gesture scale
 * to modify the uniformScale or fieldOfView properties of the camera, to perform
 * a true zooming effect.
 */
-(void) handleCameraMove: (UIPinchGestureRecognizer*) gesture {
	switch (gesture.state) {
		case UIGestureRecognizerStateBegan:
			if ( [self cc3ValidateGesture: gesture] ) [self.scene startMovingObject];
			break;
		case UIGestureRecognizerStateChanged:
			[self.scene moveObjectBy: gesture.scale];
			break;
		case UIGestureRecognizerStateEnded:
			[self.scene stopMovingObject];
			break;
		default:
			break;
	}
}

-(void) handleCameraRotateOnZAxis: (UIRotationGestureRecognizer*) gesture {
	switch (gesture.state) {
		case UIGestureRecognizerStateBegan:
			if ( [self cc3ValidateGesture: gesture] ) [self.scene startRotatingObjectOnZAxis];
			break;
		case UIGestureRecognizerStateChanged:
			[self.scene rotateObjectOnZAxisBy: gesture.rotation];
			break;
		case UIGestureRecognizerStateEnded:
			[self.scene stopRotatingObjectOnZAxis];
			break;
		default:
			break;
	}
}

-(void) handleCameraRotateOnXYAxis: (UIPanGestureRecognizer*) gesture {
	switch (gesture.state) {
		case UIGestureRecognizerStateBegan:
			if ( [self cc3ValidateGesture: gesture] ) [self.scene startRotatingObjectOnXYAxis];
			break;
		case UIGestureRecognizerStateChanged:
			[self.scene rotateObjectOnXYAxisBy: gesture.translation];
			break;
		case UIGestureRecognizerStateEnded:
			[self.scene stopRotatingObjectOnXYAxis];
			break;
		default:
			break;
	}
}


@end
