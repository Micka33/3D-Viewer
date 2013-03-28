/**
 *  _D_viewerScene.m
 *  3D viewer
 *
 *  Created by beingenious on 25/03/13.
 *  Copyright __MyCompanyName__ 2013. All rights reserved.
 */

#import "_D_viewerScene.h"
#import "CC3PODResourceNode.h"
#import "CC3ActionInterval.h"
#import "CC3MeshNode.h"
#import "CC3Camera.h"
#import "CC3Light.h"

#define ObjectName	@"3DObject"

@implementation _D_viewerScene

-(void) dealloc {
	[super dealloc];
}

/**
 * Constructs the 3D scene.
 *
 * Adds 3D objects to the scene, loading a 3D 'hello, world' message
 * from a POD file, and creating the camera and light programatically.
 *
 * When adapting this template to your application, remove all of the content
 * of this method, and add your own to construct your 3D model scene.
 *
 * NOTES:
 *
 * 1) To help you find your scene content once it is loaded, the onOpen method below contains
 *    code to automatically move the camera so that it frames the scene. You can remove that
 *    code once you know where you want to place your camera.
 *
 * 2) The POD file used for the 'hello, world' message model is fairly large, because converting a
 *    font to a mesh results in a LOT of triangles. When adapting this template project for your own
 *    application, REMOVE the POD file 'hello-world.pod' from the Resources folder of your project.
 */

#define ZOOM 2.0f
-(void) initializeScene
{
    //Dobj = [CC3Node alloc];
	// This is the simplest way to load a POD resource file and add the
	// nodes to the CC3Scene, if no customized resource subclass is needed.
	//[self addContentFromPODFile: @"hello-world.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"Badblue-anim-noinvert-tryColor.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"Cobblestones5-anim-noinvert-tryColor.pod" withName:ObjectName]; // [***ERROR***] OpenGL ES permits drawing a maximum of 65536 indexed vertices, and supports only GL_UNSIGNED_SHORT or GL_UNSIGNED_BYTE types for vertex indices
	//[self addContentFromPODFile: @"oilDrum-anim-noinvert-tryColor.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"DragonScale_Soldier.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"Atlantis_7.pod" withName:ObjectName];
	[self addContentFromPODFile: @"4.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"skull.pod" withName:ObjectName];

    Dobj = (CC3MeshNode*)[self getNodeNamed:ObjectName];
    NSLog(@"type[%@]", Dobj.class);
    //[Dobj moveMeshOriginToCenterOfGeometry];

    CGFloat maxDepth = MAX(
                           MAX(Dobj.boundingBox.maximum.z - Dobj.boundingBox.minimum.z,
                               Dobj.boundingBox.maximum.y - Dobj.boundingBox.minimum.y),
                           Dobj.boundingBox.maximum.x - Dobj.boundingBox.minimum.x);
    CGFloat camZ = maxDepth*ZOOM;

 	// Create the camera, place it back a bit, and add it to the scene
	CC3Camera* cam = [CC3Camera nodeWithName: @"Camera"];
	cam.location = cc3v(0.0f, 0.0f, camZ);
	[self addChild: cam];

	// Create a light, place it back and to the left at a specific
	// position (not just directional lighting), and add it to the scene
	CC3Light* lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v(-3.0f, 0.0f, 0.0f);
	lamp.isDirectionalOnly = NO;
	[cam addChild: lamp];
	lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v(3.0f, 0.0f, 0.0f);
	lamp.isDirectionalOnly = NO;
	[cam addChild: lamp];
	lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v(0.0f, -3.0f, 0.0f);
	lamp.isDirectionalOnly = NO;
	[cam addChild: lamp];
	lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v(0.0f, 3.0f, 0.0f);
	lamp.isDirectionalOnly = NO;
	lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v(0.0f, 0.0f, 0.0f);
	lamp.isDirectionalOnly = NO;
	[cam addChild: lamp];

	//self.ambientLight = kCCC4FBlackTransparent;
    //NSLog(@"isIlluminated=%d", self.isIlluminated);
    
    [self addChild: Dobj];
	// Create OpenGL ES buffers for the vertex arrays to keep things fast and efficient,
	// and to save memory, release the vertex content in main memory because it is now redundant.
	[self createGLBuffers];
	[self releaseRedundantContent];

	// That's it! The scene is now constructed and is good to go.

	// To help you find your scene content once it is loaded, the onOpen method below contains
	// code to automatically move the camera so that it frames the scene. You can remove that
	// code once you know where you want to place your camera.

	// If you encounter problems displaying your models, you can uncomment one or more of the
	// following lines to help you troubleshoot. You can also use these features on a single node,
	// or a structure of nodes. See the CC3Node notes for more explanation of these properties.
	// Also, the onOpen method below contains additional troubleshooting code you can comment
	// out to move the camera so that it will display the entire scene automatically.

	// Displays short descriptive text for each node (including class, node name & tag).
	// The text is displayed centered on the pivot point (origin) of the node.

	// Displays bounding boxes around those nodes with local content (eg- meshes).
	self.shouldDrawAllLocalContentWireframeBoxes = YES;

	// Displays bounding boxes around all nodes. The bounding box for each node
	// will encompass its child nodes.
	self.shouldDrawAllWireframeBoxes = YES;

	// If you encounter issues creating and adding nodes, or loading models from
	// files, the following line is used to log the full structure of the scene.
	//LogInfo(@"The structure of this scene is: %@", [self structureDescription]);

/*
	CCActionInterval* partialRot = [CC3RotateBy actionWithDuration: 1.0
														  rotateBy: cc3v(0.0, 30.0, 0.0)];
	CCActionInterval* backPartialRot = [CC3RotateBy actionWithDuration: 1.0
														  rotateBy: cc3v(0.0, -30.0, 0.0)];
    CCActionInterval* tintCycle = [CCSequence actionOne: partialRot two: backPartialRot];
	[Dobj runAction: [CCRepeatForever actionWithAction: tintCycle]];
*/
    /** Set this parameter to adjust the rate of camera movement during a pinch gesture. */
    kObjectPinchMovementUnit = maxDepth/2.5;
}


#pragma mark Updating custom activity

/**
 * This template method is invoked periodically whenever the 3D nodes are to be updated.
 *
 * This method provides your app with an opportunity to perform update activities before
 * any changes are applied to the transformMatrix of the 3D nodes in the scene.
 *
 * For more info, read the notes of this method on CC3Node.
 */
-(void) updateBeforeTransform: (CC3NodeUpdatingVisitor*) visitor {}

/**
 * This template method is invoked periodically whenever the 3D nodes are to be updated.
 *
 * This method provides your app with an opportunity to perform update activities after
 * the transformMatrix of the 3D nodes in the scen have been recalculated.
 *
 * For more info, read the notes of this method on CC3Node.
 */
-(void) updateAfterTransform: (CC3NodeUpdatingVisitor*) visitor {
	// If you have uncommented the moveWithDuration: invocation in the onOpen: method, you
	// can uncomment the following to track how the camera moves, where it ends up, and what
	// the camera's clipping distances are, in order to determine how to position and configure
	// the camera to view the entire scene.
//	LogDebug(@"Camera: %@", activeCamera.fullDescription);
}


#pragma mark Scene opening and closing

/**
 * Callback template method that is invoked automatically when the CC3Layer that
 * holds this scene is first displayed.
 *
 * This method is a good place to invoke one of CC3Camera moveToShowAllOf:... family
 * of methods, used to cause the camera to automatically focus on and frame a particular
 * node, or the entire scene.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) onOpen {

	// Move the camera to frame the scene. You can uncomment the LogDebug line in the
	// updateAfterTransform: method to track how the camera moves, where it ends up, and
	// what the camera's clipping distances are, in order to determine how to position
	// and configure the camera to view your entire scene. Then you can remove this code.
	[self.activeCamera moveWithDuration: 3.0 toShowAllOf: self withPadding: 0.1f];

	// Uncomment this line to draw the bounding box of the scene.
	//self.shouldDrawWireframeBox = YES;
}

/**
 * Callback template method that is invoked automatically when the CC3Layer that
 * holds this scene has been removed from display.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) onClose {}


#pragma mark Handling touch events 

/**
 * This method is invoked from the CC3Layer whenever a touch event occurs, if that layer
 * has indicated that it is interested in receiving touch events, and is handling them.
 *
 * Override this method to handle touch events, or remove this method to make use of
 * the superclass behaviour of selecting 3D nodes on each touch-down event.
 *
 * This method is not invoked when gestures are used for user interaction. Your custom
 * CC3Layer processes gestures and invokes higher-level application-defined behaviour
 * on this customized CC3Scene subclass.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) touchEvent: (uint) touchType at: (CGPoint) touchPoint {}

/**
 * This callback template method is invoked automatically when a node has been picked
 * by the invocation of the pickNodeFromTapAt: or pickNodeFromTouchEvent:at: methods,
 * as a result of a touch event or tap gesture.
 *
 * Override this method to perform activities on 3D nodes that have been picked by the user.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) nodeSelected: (CC3Node*) aNode byTouchEvent: (uint) touchType at: (CGPoint) touchPoint {}



#pragma mark Gesture handling

-(void) startMovingObject { objectZAxisStartLocation = Dobj.location; }
-(void) stopMovingObject {}
-(void) moveObjectBy:  (CGFloat) aMovement
{
	// Convert to a logarithmic scale, zero is backwards, one is unity, and above one is forward.
	GLfloat camMoveDist = logf(aMovement) * -kObjectPinchMovementUnit;
	CC3Vector moveVector = CC3VectorScaleUniform(activeCamera.globalForwardDirection, camMoveDist);
	Dobj.location = CC3VectorAdd(objectZAxisStartLocation, moveVector);
}


-(void) startRotatingObjectOnZAxis { objectZAxisStartRotation = CC3VectorMake(0.0f, 0.0f, 0.0f); }
-(void) rotateObjectOnZAxisBy: (CGFloat) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(0.0f, 0.0f, aMovement*60);
    [Dobj rotateBy:CC3VectorDifference(objectZAxisStartRotation, rotateVector)];
    objectZAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnZAxis {}


-(void) startRotatingObjectOnXYAxis { objectXYAxisStartRotation =  CC3VectorMake(0.0f, 0.0f, 0.0f); }
-(void) rotateObjectOnXYAxisBy: (CGPoint) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(aMovement.y, aMovement.x, 0.0f);
    [Dobj rotateBy:CC3VectorDifference(rotateVector, objectXYAxisStartRotation)];
    objectXYAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnXYAxis {}


@end

