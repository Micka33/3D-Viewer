//
//  Pin.m
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import "Pin.h"

@implementation Pin

@synthesize pins=_pins, container=_container, parent=_parent, scale=_scale;

static CGFloat count = 0;

- (Pin*)initWithParent:(CC3Node*)pparent
{
    self = [super init];
    if (self)
    {
        [_pins init];
        _container = Nil;
        _parent = Nil;
        _scale = 1;
        [self setParent:pparent];
    }
    return self;
}

- (void)setParent:(CC3Node*)pparent
{
    _parent = pparent;
    if (_container == Nil)
        _container = [[CC3Node alloc] initWithName:@"pinContainer"];
    if (_parent != Nil)
        [_parent addChild:_container];
}

- (pin_descriptor*)addPinViaDbWithName:(NSString*)name atLocation:(CC3Vector)location withEnvRotation:(CC3Vector)envRotation
{
    return [self addPinWithName:name atLocation:location withEnvRotation:envRotation];
}

- (pin_descriptor*)addPinWithName:(NSString*)name atLocation:(CC3Vector)location withEnvRotation:(CC3Vector)envRotation
{
    CC3Node *newPin = [self createPinWithName:name atLocation:location withSize:10];
    //CC3Vector parentPosition = _parent.location;
    CC3Vector parentRotation = parent.rotation;
    pin_descriptor *pin = [pin_descriptor alloc];
    [_pins addObject:[pin initWithName:name atPosition:location withEnvRotation:envRotation withInitalRotation:parentRotation withNumber:count withNode:newPin]];
    return pin;
}

- (void)renderPins
{
    int count = 0;
    while (_pins.count > count)
    {
        pin_descriptor *pin = _pins[count];
        [self renderPin:pin.pivot withRotation:pin.initialRotation withInit:true];
        ++count;
    }
}

- (void)renderPin:(CC3Node*)pin withRotation:(CC3Vector)rotation withInit:(Boolean)init
{
    pin.scale = cc3v(_scale, _scale, _scale);
    if (init)
        [_container setRotation:rotation];
    [_container addChild:pin];
    if (init)
        [_container setRotation:cc3v(0, 0, 0)];
}

- (void)setScale:(CGFloat)sscale
{
    _scale = sscale;
}

- (CC3Node*)createPinWithName:(NSString*)name atLocation:(CC3Vector)location withSize:(int)size
{
    CC3MeshNode *cube = [[CC3MeshNode alloc] initWithName:name];
    [cube populateAsSolidBox:CC3BoundingBoxMake(-(size/2), -(size/2), -(size/2), (size/2), (size/2), (size/2))];
    [cube setLocation:location];
    return cube;
}

@end







