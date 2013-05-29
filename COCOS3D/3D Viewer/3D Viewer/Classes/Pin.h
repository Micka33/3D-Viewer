//
//  Pin.h
//  3D viewer
//
//  Created by beingenious on 4/23/13.
//
//

#import <Foundation/Foundation.h>
#import "pin_descriptor.h"

@interface Pin : NSObject
{
@private
    NSMutableArray *pins;
    CC3Node *container;
    CC3Node *parent;
    CGFloat scale;
}

- (Pin*)initWithParent:(CC3Node*)parent;
- (Pin*)setParent:(CC3Node*)parent;
- (pin_descriptor*)addPinWithName:(NSString*)name
                       atLocation:(CC3Vector*)location
                  withEnvRotation:(CC3Vector*)envRotation;
- (void)setScale:(CGFloat)scale;
- (void)renderPins;

@end
