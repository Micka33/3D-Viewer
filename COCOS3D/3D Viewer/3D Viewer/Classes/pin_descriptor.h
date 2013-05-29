//
//  pin_descriptor.h
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import <Foundation/Foundation.h>
#import "CC3Scene.h"
#import "CC3PODNode.h"

@interface pin_descriptor : NSObject
{
    @public
        NSString *name;
        CC3Vector *position;
        CC3Vector *rotation;
        CGFloat num;
        CC3Vector *initialRotation;
        CC3Node *pivot;
}

- (void) initWithName:(NSString*)name
           atPosition:(CC3Vector*)position
      withEnvRotation:(CC3Vector*)envRotation
   withInitalRotation:(CC3Vector*)initialRotation
           withNumber:(CGFloat)num
             withNode:pivot;

- (NSString*) to_string;


@end
