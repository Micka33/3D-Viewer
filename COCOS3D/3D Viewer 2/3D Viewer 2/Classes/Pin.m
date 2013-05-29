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
        _pins = [[NSMutableArray alloc] init];
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
    CC3Node *newPin = [self createPinWithName:name atLocation:location withSize:0.05];
    //CC3Vector parentPosition = _parent.location;
    CC3Vector parentRotation = parent.rotation;
    pin_descriptor *pin = [[pin_descriptor alloc] initWithName:name atPosition:location withEnvRotation:envRotation withInitalRotation:parentRotation withNumber:count withNode:newPin];
    [_pins addObject:pin];
    return pin;
}

- (void)renderPins
{
    int count = 0;
    NSLog(@"count(%d)", [_pins count]);
    while ([_pins count] > count)
    {
        pin_descriptor *pin = _pins[count];
        [self renderPin:pin.pivot withRotation:pin.rotation withInitRotation:pin.initialRotation withInit:true];
        ++count;
    }
}

- (void)renderPin:(CC3Node*)pin withRotation:(CC3Vector)rotation withInitRotation:(CC3Vector)Initrotation withInit:(Boolean)init
{
    pin.scale = cc3v(_scale, _scale, _scale);

// if (init)
//        [_container setRotation:rotation];

    NSLog(@"rotation(x,y,z):%f,%f,%f", rotation.x,rotation.y,rotation.z);
    [_container setRotation:rotation];
    [_container addChild:pin];
    [_container setRotation:cc3v(0,0,0)];
    NSLog(@"pin(xyz):%f,%f,%f", pin.location.x, pin.location.y, pin.location.z);

// if (init)
//        [_container setRotation:cc3v(0, 0, 0)];

}

- (void)setScale:(CGFloat)sscale
{
    _scale = sscale;
}

- (CC3Node*)createPinWithName:(NSString*)name atLocation:(CC3Vector)location withSize:(CGFloat)size
{
    CC3MeshNode *cube = [[CC3MeshNode alloc] initWithName:name];
    [cube populateAsSolidBox:CC3BoundingBoxMake(-(size/2), -(size/2), -(size/2), (size/2), (size/2), (size/2))];
    [cube setColor:ccBLUE];
    [cube setLocation:location];
    NSLog(@"cube(xyz):%f,%f,%f", cube.location.x, cube.location.y, cube.location.z);
    return cube;
}

@end







