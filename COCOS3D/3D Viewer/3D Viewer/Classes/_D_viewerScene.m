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

-(CC3MeshNode*) getFirstMesh
{
    GLuint count = 1;
    CC3Node *item;
    
    item = [self getNodeTagged: count];
    while ([item isMeshNode] == NO)
    {
        item = [self getNodeTagged: ++count];
        NSLog(@"name[%@]", item.name);
    }
    return (CC3MeshNode*)item;
}
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
	[self addContentFromPODFile: @"3.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"skull.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"Gladius.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"cello_and_stand.pod" withName:ObjectName];

    self->Dobj = //[self getFirstMesh];
    self->Dobj = (CC3PODResourceNode*)[self getNodeNamed:ObjectName];
    //NSLog(@"type[%@]", Dobj.class);
    //NSLog(@"maxDepth=%f", maxDepth);
	self->cam = [[CC3Camera alloc] init];
	self->light = [[CC3Light alloc] init];
    self->eye = [[CC3Node alloc] init];
    self->container = [[CC3MeshNode alloc] init];
    /**
     * We get the maximum width/depth/high
     * on any of the X/Y/Z axis
     */
    CGFloat maxDepth = MAX(
                           MAX(self->Dobj.boundingBox.maximum.z - self->Dobj.boundingBox.minimum.z,
                               self->Dobj.boundingBox.maximum.y - self->Dobj.boundingBox.minimum.y),
                           self->Dobj.boundingBox.maximum.x - self->Dobj.boundingBox.minimum.x);
    /**
     * We set the cam position on the Z axis
     * to be sure we have the complete object
     * on screen
     */
    CGFloat camZ = maxDepth*ZOOM;
    /**
     * Container set to 0x/0y/0z position
     */
    self->container.location = cc3v(0.0f, 0.0f, 0.0f);
    /**
     * Object set to 0x/0y/0z position into the container
     */
    self->Dobj.location = cc3v(0.0f, 0.0f, 0.0f);
    /**
     * Eye set to 0x/0y/camZ position
     * We set the eye to be at camZ away from the object
     */
	self->eye.location = cc3v(0.0f, 0.0f, camZ);
    /**
     * Cam set to 0x/0y/camZ position
     */
	self->cam.location = cc3v(0.0f, 0.0f, 0.0f);
    /**
     * Light set to 1x/1y/1z position
     * The light is directional to act like a "sun"
     * A directional-only light is not subject to
     * attenuation over distance
     */
	self->light.location = cc3v(1.0f, 1.0f, 1.0f);
    self->light.isDirectionalOnly = YES;
	//self.ambientLight = kCCC4FWhite;
    
    /**/[self->Dobj addAxesDirectionMarkers];
    /**/[self->container addAxesDirectionMarkers];
    
    /**
     * We ensure the container origine is in the middle
     */
    [self->container moveMeshOriginToCenterOfGeometry];
    /**
     * We put the cam and light into the eye
     * If the eye is moving, the light and cam will do the same
     */
	[self->eye addChild: self->cam];
	[self->eye addChild: self->light];
    /**
     * We insert the Dobj into the container
     * We then, use the container as a blackbox to manipulate the object
     */
	[self->container addChild: self->Dobj];
    /**
     * We add the eye and the object to the scene
     */
	[self addChild: self->eye];
    [self addChild: self->container];

	// Create OpenGL ES buffers for the vertex arrays to keep things fast and efficient,
	// and to save memory, release the vertex content in main memory because it is now redundant.
	[self createGLBuffers];
	[self releaseRedundantContent];

	// Displays bounding boxes around those nodes with local content (eg- meshes).
	//self.shouldDrawAllLocalContentWireframeBoxes = YES;

	// Displays bounding boxes around all nodes. The bounding box for each node
	// will encompass its child nodes.
	//self.shouldDrawAllWireframeBoxes = YES;

    /**
     * Set this parameter to adjust the rate of camera movement during a pinch gesture. ZOOM
     */
    ZoomRate = maxDepth/2.5;
    /**
     * Set this parameter to adjust the rate of camera movement during a double pan gesture. X Y translation
     */
    TranslationXYRate = maxDepth/600;
    /**
     * Set this parameter to adjust the rate of camera movement during a pan gesture. X Y rotation 
     */
    RotationXYRate = 1/1.7;
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
	//[self.activeCamera moveWithDuration: 1.5 toShowAllOf: self withPadding: 0.1f];

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

/*PINCH GESTURE*/
-(void) startMovingObject
{
    NSLog(@"TRANSLATION Z");
    self->objectZAxisStartLocation = self->eye.location;
}
-(void) moveObjectBy:  (CGFloat) aMovement
{
	// Convert to a logarithmic scale, zero is backwards, one is unity, and above one is forward.
	GLfloat camMoveDist = logf(aMovement) * self->ZoomRate;
	CC3Vector moveVector = CC3VectorScaleUniform(self->eye.globalForwardDirection, camMoveDist);
	self->eye.location = CC3VectorAdd(self->objectZAxisStartLocation, moveVector);
    
    //NSLog(@"SCENE:WIDTH=%f OBJ:WIDTH=%f",
    //      self.boundingBox.maximum.x - self.boundingBox.minimum.x, Dobj.boundingBox.maximum.x - Dobj.boundingBox.minimum.x);
}
-(void) stopMovingObject
{
    NSLog(@"TRANSLATION Z END");
}

/*ROTATION GESTURE*/
-(void) startRotatingObjectOnZAxis
{
    NSLog(@"ROTATION Z");
    self->objectZAxisStartRotation = CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) rotateObjectOnZAxisBy: (CGFloat) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(0.0f, 0.0f, aMovement * 60);
    [self->eye rotateBy:CC3VectorDifference(self->objectZAxisStartRotation, rotateVector)];
    self->objectZAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnZAxis
{
    NSLog(@"ROTATION Z END");
}

/*PAN GESTURE*/
-(void) startRotatingObjectOnXYAxis
{
    NSLog(@"ROTATION XY");
    self->objectXYAxisStartRotation =  CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) rotateObjectOnXYAxisBy: (CGPoint) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(aMovement.y * self->RotationXYRate,
                                           aMovement.x * self->RotationXYRate,
                                           0.0f);
    [self->container rotateBy:CC3VectorDifference(rotateVector, self->objectXYAxisStartRotation)];
    self->objectXYAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnXYAxisAtPoint:(CGPoint)finalPoint
                             withDuration:(CGFloat)duration
{
    NSLog(@"ROTATION XY END");
    //UIViewAnimationOptionCurveEaseOut
}

-(void) startMovingObjectOnXYAxis
{
    NSLog(@"TRANSLATION XY");
    self->objectXYAxisStartMove =  CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) moveObjectOnXYAxisBy: (CGPoint) aMovement
{
    //NSLog(@"ORI X:%f, Y:%f, Z:%f", objectXYAxisStartMove.x, objectXYAxisStartMove.y, objectXYAxisStartMove.z);
	CC3Vector translateVector = CC3VectorMake(aMovement.x  * self->TranslationXYRate,
                                              -aMovement.y * self->TranslationXYRate,
                                              0.0f);
    //CC3Vector by = CC3VectorDifference(translateVector, objectXYAxisStartMove);
    //NSLog(@"BY X:%f, Y:%f, Z:%f", by.x, by.y, by.z);
    [self->container translateBy:CC3VectorDifference(translateVector, self->objectXYAxisStartMove)];
     self->objectXYAxisStartMove = translateVector;
}
-(void) stopMovingObjectOnXYAxis
{
    NSLog(@"TRANSLATION XY END");
}


@end

