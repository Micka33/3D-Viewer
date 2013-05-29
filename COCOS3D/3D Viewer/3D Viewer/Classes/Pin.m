//
//  Pin.m
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import "Pin.h"

@implementation Pin
static CGFloat count = 0;


- (Pin*)initWithParent:(CC3Node*)parent=Nil
{
    [_pins init];
    _container = Nil;
    _parent = Nil;
    scale = 1;;
    [self.setParent parent];
    return self;
}

- (Pin*)setParent:(CC3Node*)parent
{
    _parent = parent;
    if (_container == nil)
        _container = [CC3Node initialize];
    if (_parent != Nil)
        [_parent addChild:_container];
    return self;
}

- (pin_descriptor*)addPinViaDbWithName:(NSString*)name atLocation:(CC3Vector*)location withEnvRotation:(CC3Vector*)envRotation
{
    return [self addPinWithName:name atLocation:location withEnvRotation:envRotation];
}

- (pin_descriptor*)addPinWithName:(NSString*)name atLocation:(CC3Vector*)location withEnvRotation:(CC3Vector*)envRotation
{
    CC3Node *newPin = [self createPinWithName:name atLocation:location withSize:10];
    CC3Vector *parentPosition = _parent.location;
    CC3Vector *parentRotation = _parent.rotation;
    [_pins addObject:[[pin_descriptor alloc] initWithName:name atPosition:location withEnvRotation:envRotation withInitalRotation:parentRotation withNumber:_count withNode:newPin]];
}

- (void)renderPins
{
    int count = 0;
    while (_pins.count > count)
    {
        [self renderPin:_pins[count].pivot withRotation:_pins[count].initialRotation withInit:true];
        ++count;
    }
}

- (void)renderPin:(CC3Node*)pin withRotation:(CC3Vector)rotation, withinit:(Boolean)true
{
    pin.location.x *= _scale;
    pin.location.y *= _scale;
    pin.location.z *= _scale;
    [_container setRotation:rotation];
    [_container addChild:pin];
    [_container setRotation:cc3v(0, 0, 0)];
}

- (void)setScale:(CGFloat)scale
{
    _scale = scale;
}

@end







