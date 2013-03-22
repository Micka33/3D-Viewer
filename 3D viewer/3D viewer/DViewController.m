//
//  3DViewController.m
//  3D viewer
//
//  Created by beingenious on 20/03/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()

@end

@implementation DViewController

@synthesize _DModel, _camera, _translation, _panRecognizer, _rotation, _rotationRecognizer, _tmpLastRotation, _pinchRecognizer, _scale, _tmpLastScale;

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
    _translation.x = 0.0f;
    _translation.y = 0.0f;
    _rotation = 0.0f;
    _tmpLastRotation = 0.0f;
    _tmpLastScale = 1.0f;
    _scale = 0.0f;

    _panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [_panRecognizer setMinimumNumberOfTouches:1];
    [_panRecognizer setMaximumNumberOfTouches:1];
    [_panRecognizer setDelegate:self];

    _rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [_rotationRecognizer setDelegate:self];

    _pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [_pinchRecognizer setDelegate:self];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer
{
    //[self.view bringSubviewToFront:[recognizer view]];
	if([recognizer state] == UIGestureRecognizerStateEnded)
    {
		_tmpLastScale = 1.0f;
		return;
	}
	_scale = 1.0f - (_tmpLastScale - [recognizer scale]);
    if (_scale > 1.0f)
        _scale -= 1.0f;
    else if (_scale < 1.0f)
        _scale = _scale - 1.0f;
    else if (_scale == 1.0f)
        _scale = 0.0f;
    //NSLog(@"scale=%f", _scale);
	_tmpLastScale = [recognizer scale];
}

- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer
{
    //[self.view bringSubviewToFront:[recognizer view]];
	if([recognizer state] == UIGestureRecognizerStateEnded)
    {
        _rotation = 0.0f;
		_tmpLastRotation = 0.0f;
		return;
	}
	_rotation = 0.0f - (_tmpLastRotation - [recognizer rotation]);
    //NSLog(@"rotationZ=%f", _rotation);
	//CGAffineTransform currentTransform = [recognizer view].transform;
	//CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
	//[[recognizer view] setTransform:newTransform];
	_tmpLastRotation = [recognizer rotation];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    if([recognizer state] == UIGestureRecognizerStateEnded)
    {
		_translation.x = 0.0f;
		_translation.y = 0.0f;
		return;
	}
    _translation = [recognizer translationInView:self.view];
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

/*
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);

        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);

        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
    }*/
}

- (void)drawView
{
    _DModel.z += (_scale*0.2f);
    [_DModel rotateRelativeToX:_translation.y*0.3f toY:_translation.x*0.3f toZ:(-_rotation)*95.0f];

    static float increment = 0.0f;
    ++increment;
    //NGLLight *defaultLight = [NGLLight defaultLight];
    //defaultLight.x = sinf(increment*0.05f)*5.0f;
    //defaultLight.y = cosf(increment*0.05f)*5.0f;
    
    if (_DModel.x > self.view.frame.size.width)
        _DModel.x = self.view.frame.size.width;
    if (_DModel.x < 0.0f)
        _DModel.x = 0.0f;
    if (_DModel.y > self.view.frame.size.width)
        _DModel.y = self.view.frame.size.width;
    if (_DModel.y < 0.0f)
        _DModel.y = 0.0f;
    if (_DModel.z > 0.8f)
        _DModel.z = 0.8f;

    _scale = 0.0f;
    _rotation = 0.0f;
    _translation.x = 0.0f;
    _translation.y = 0.0f;

    [_camera drawCamera];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    self.view.multipleTouchEnabled = TRUE;
    [self.view addGestureRecognizer:_panRecognizer];
	[self.view addGestureRecognizer:_rotationRecognizer];
	[self.view addGestureRecognizer:_pinchRecognizer];

    //NGLFog *defaultFog = [NGLFog defaultFog];
    //defaultFog.type = NGLFogTypeLinear;
    //defaultFog.start = 10.0f;
    //defaultFog.end = 15.0f;
    
    nglGlobalTextureOptimize(NGLTextureOptimizeNone);
    nglGlobalLightEffects(NGLLightEffectsOFF);
    //nglGlobalFrontAndCullFace(NGLFrontFaceCCW, NGLCullFaceBack);
    nglGlobalFlush();

    // Setting the loading process parameters. To take advantage of the NGL Binary feature,
	// remove the line "kNGLMeshOriginalYes, kNGLMeshKeyOriginal,". Your mesh will be loaded 950% faster.
	NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
							  kNGLMeshOriginalYes, kNGLMeshKeyOriginal,
							  kNGLMeshCentralizeYes, kNGLMeshKeyCentralize,
							  @"0.3", kNGLMeshKeyNormalize,
							  nil];

	//_DModel = [[NGLMesh alloc]      initWithFile:@"cube.obj" settings:settings delegate:nil];
    _DModel = [[NGLMesh alloc]      initWithFile:@"Pistol.obj" settings:settings delegate:nil];
    //_DModel = [[NGLMesh alloc]      initWithFile:@"Metro city.obj" settings:settings delegate:nil];
    //_DModel = [[NGLMesh alloc]      initWithFile:@"IronArmour.obj" settings:settings delegate:nil];
    //_DModel = [[NGLMesh alloc]      initWithFile:@"skull.obj" settings:settings delegate:nil];

    _camera = [[NGLCamera alloc]    initWithMeshes:_DModel, nil];
	[_camera autoAdjustAspectRatio:YES animated:YES];

    _DModel.rotationSpace = NGLRotationSpaceWorld;
    //_DModel.rotationOrder = NGLRotationOrderZYX;

    //NGLLight *defaultLight = [NGLLight defaultLight];
    //defaultLight.attenuation = 5.0f;
    //defaultLight.color = nglColorFromUIColor([UIColor orangeColor]);

	// Starts the debug monitor.
	[[NGLDebug debugMonitor] startWithView:(NGLView *)self.view];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
        shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


/*- (void) dealloc
{
	[_DModel release];
	[_camera release];
	
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/


@end
