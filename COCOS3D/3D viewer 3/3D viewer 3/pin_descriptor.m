//
//  pin_descriptor.m
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import "pin_descriptor.h"

@implementation pin_descriptor


- (pin_descriptor*) initWithName:(NSString*)nname
           atPosition:(CC3Vector)pposition
      withEnvRotation:(CC3Vector)eenvRotation
   withInitalRotation:(CC3Vector)iinitialRotation
           withNumber:(CGFloat)nnum
             withNode:(CC3Node*)ppivot
{
    self = [super init];
    if (self)
    {
        _name = nname;
        _position = pposition;
        _rotation = eenvRotation;
        _initialRotation = iinitialRotation;
        _num = nnum;
        _pivot = ppivot;
    }
    return self;
}

- (NSString*) to_string
{
    return [NSString stringWithFormat:@"Pin Number:%f, named:%@, at(x,y,z):%f,%f,%f, withRotation(x,y,z):%f,%f,%f", _num, _name, _position.x,_position.y,_position.z, _rotation.x,_rotation.y,_rotation.z];
}



@end
