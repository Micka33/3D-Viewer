//
//  pin_descriptor.m
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import "pin_descriptor.h"

@implementation pin_descriptor


- (void) initWithName:(NSString*)name
           atPosition:(CC3Vector*)position
      withEnvRotation:(CC3Vector*)envRotation
   withInitalRotation:(CC3Vector*)initialRotation
           withNumber:(GCFloat)num
             withNode:pivot
{
    _name = name;
    _position = position;
    _rotation = rotation;
    _initialRotation = initalRotation;
    _num = num;
    _pivot = pivot;
}

- (NSString*) to_string
{
    return "Pin Number:"+_num+", named:"+_name+", at(x,y,z):"+_position.x+","+_position.y+","+_position.z+", WithRotation(x,y,z):"+_rotation.x+","+_rotation.y+","+_rotation.z;
}



@end
