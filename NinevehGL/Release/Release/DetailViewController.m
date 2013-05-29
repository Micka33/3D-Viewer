//
//  DetailViewController.m
//  Release
//
//  Created by beingenious on 4/5/13.
//  Copyright (c) 2013 beingenious. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
        [self doInit];
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
        [self doInit];
    return self;
}

-(id)init
{
    self = [super init];
    if (self)
        [self doInit];
    return self;
}

-(void)doInit
{
    // Setting the loading process parameters. To take advantage of the NGL Binary feature,
	// remove the line "kNGLMeshOriginalYes, kNGLMeshKeyOriginal,". Your mesh will be loaded 950% faster.
	_settings = [NSDictionary dictionaryWithObjectsAndKeys:
                 kNGLMeshOriginalYes, kNGLMeshKeyOriginal,
                 kNGLMeshCentralizeYes, kNGLMeshKeyCentralize,
                 @"0.3", kNGLMeshKeyNormalize,
                 nil];

    _panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [_panRecognizer setMinimumNumberOfTouches:1];
    [_panRecognizer setMaximumNumberOfTouches:1];
    [_panRecognizer setDelegate:self];

    _panRecognizerDouble = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoublePan:)];
    [_panRecognizerDouble setMinimumNumberOfTouches:2];
    [_panRecognizerDouble setMaximumNumberOfTouches:2];
    [_panRecognizerDouble setDelegate:self];

    _rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [_rotationRecognizer setDelegate:self];

    _pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [_pinchRecognizer setDelegate:self];
}

-(void)reset
{
    _panTranslation.x = 0.0f;
    _panTranslation.y = 0.0f;
    _panRotation.x = 0.0f;
    _panRotation.y = 0.0f;
    _rotation = 0.0f;
    _tmpLastRotation = 0.0f;
    _tmpLastScale = 1.0f;
    _scale = 0.0f;
    
    [_camera removeAllMeshes];
}

-(void)loadNewObject:(NSString*)ObjectName
{
    [self reset];
    _DModel = [[NGLMesh alloc]      initWithFile:ObjectName settings:_settings delegate:nil];
    _DModel.rotationSpace = NGLRotationSpaceWorld;
    
    _camera = [[NGLCamera alloc]    initWithMeshes:_DModel, nil];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer
{
	if([recognizer state] == UIGestureRecognizerStateEnded)
    {
		_tmpLastScale = 1.0f;
        _scale = 0.0f;
		return;
	}
	_scale = 1.0f - (_tmpLastScale - [recognizer scale]);
    if (_scale > 1.0f)
        _scale -= 1.0f;
    else if (_scale < 1.0f)
        _scale = _scale - 1.0f;
    else if (_scale == 1.0f)
        _scale = 0.0f;
	_tmpLastScale = [recognizer scale];
}

- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer
{
	if([recognizer state] == UIGestureRecognizerStateEnded)
    {
        _rotation = 0.0f;
		_tmpLastRotation = 0.0f;
		return;
	}
    //([recognizer state] == UIGestureRecognizerStateChanged)
	_rotation = 0.0f - (_tmpLastRotation - [recognizer rotation]);
	_tmpLastRotation = [recognizer rotation];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
		_panRotation.x = 0.0f;
		_panRotation.y = 0.0f;
		return;
	}
    if ([recognizer state] == UIGestureRecognizerStateChanged)
    {
        _panRotation = [recognizer translationInView:self.view];
        [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    }
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
    }
}
- (void)handleDoublePan:(UIPanGestureRecognizer *)recognizer
{
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
		_panTranslation.x = 0.0f;
		_panTranslation.y = 0.0f;
		return;
	}
    //([recognizer state] == UIGestureRecognizerStateChanged)
    _panTranslation = [recognizer translationInView:self.view];
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (void)drawView
{
    if (_scale != 0.0f)
        _DModel.z += (_scale*0.2f);
    if ((_panRotation.y != 0.0f) || (_panRotation.x != 0.0f) || (_rotation != 0.0f))
        [_DModel rotateRelativeToX:_panRotation.y*0.3f toY:_panRotation.x*0.3f toZ:(-_rotation)*95.0f];

    if (_DModel.z > 0.8f)
        _DModel.z = 0.8f;
    
    _scale = 0.0f;
    _rotation = 0.0f;
    _panRotation.x = 0.0f;
    _panRotation.y = 0.0f;
    [_camera drawCamera];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    self.view.multipleTouchEnabled = TRUE;
    [self.view addGestureRecognizer:_panRecognizer];
	[self.view addGestureRecognizer:_rotationRecognizer];
	[self.view addGestureRecognizer:_pinchRecognizer];
    
    nglGlobalTextureOptimize(NGLTextureOptimizeAlways);
    nglGlobalLightEffects(NGLLightEffectsON);
    //NGLFrontFaceCCW;NGLFrontFaceCW//NGLCullFaceBack;NGLCullFaceFront;NGLCullFaceNone
    nglGlobalFrontAndCullFace(NGLFrontFaceCCW, NGLCullFaceNone);
    //NGLAntialiasNone//NGLAntialias4X//NGL_NULL
    nglGlobalAntialias(NGL_NULL);
    //NGL_MAX_FPS
    nglGlobalFPS(NGL_MAX_FPS);
    nglGlobalFlush();
    
    //_DModel = [[NGLMesh alloc]      initWithFile:@"Pistol.obj" settings:_settings delegate:nil];
    //_DModel = [[NGLMesh alloc]      initWithFile:@"2.dae" settings:settings delegate:nil];

    _camera = [[NGLCamera alloc] init];
	[_camera autoAdjustAspectRatio:YES animated:YES];

    NGLLight *defaultLight = [NGLLight defaultLight];
    defaultLight.attenuation = 5.0f;

	// Starts the debug monitor.
	//[[NGLDebug debugMonitor] startWithView:(NGLView *)self.view];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end