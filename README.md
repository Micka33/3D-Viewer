3D-Viewer
=================

This project is a 3D viewer for iOs. NinevehGL and VCGLib are no longer under development and may not even compile.
The current working project is contained into COCOS3D:
 - V1: 3D viewer
 - V2: 3D viewer 2
 - V3: 3D viewer 3

V2 is fully functionnal but is being cleaned and refreshed in V3.


Depdencencies
=================

The only dependecy in Vx is COCOS3D which itself depends on COCOS2D.

Install
=================

To make it simple I have made a script: install.sh.
This script will install COCOS3D with COCOS2D.

You can then launch xcode using COCOS3D/cocos3D.xcworkspace and run 3D Viewer 3.

About the code (V2)
=================

The scene is initialized in _D_Viewer_3Scene.m:

Add the PODFile to the scene with the name `ObjectName` so we can get back this pod by this name and store it into `self->Dobj`

```Objective-C
[self addContentFromPODFile: @"oilDrum-anim-noinvert-tryColor.pod" withName:ObjectName];
self->Dobj = (CC3PODResourceNode*)[self getNodeNamed:ObjectName];
```

We create a cam and a light, the first one will watch te object the second one will give a shadow/lighting effect on the object.
we will later add both into eye, so if we move eye both the light and the cam follow.

```Objective-C
self->cam = [CC3Camera nodeWithName:@"camera"];
self->light = [CC3Light nodeWithName:@"light"];
self->eye = [CC3Node nodeWithName:@"eye"];
```

Container will contains the object and the pins.
pins is added to container using the method `initWithParent:`

```Objective-C
self->container = [CC3Node nodeWithName:@"container"];
self->pins = [[Pin alloc] initWithParent:self->container];
```

We now set a lot of pins.
`self->pins` is a pin object.

```Objective-C
[self addPins];
    {
        [self->pins addPinViaDbWithName:@"Pin_1366966890286" atLocation:cc3v(-0.1581914805533408, 0.3393462707658766, -1.10313954336729) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
        .
        .
    }
```
By calling the method `addPinViaDbWithName:` we will add the pin into an array of `pin_descriptor` contained in the object `self->pins`.
we do not add them to the scene now because we still have to calculate the scale of the object.

We set everything to 0. useless?
```Objective-C
[self->Dobj setLocation:cc3v(0.0f, 0.0f, 0.0f)];
[self->container setLocation:cc3v(0.0f, 0.0f, 0.0f)];
[self->eye setLocation:cc3v(0.0f, 0.0f, 0.0f)];
[self->cam setLocation:cc3v(0.0f, 0.0f, 0.0f)];
[self->light setLocation:cc3v(0.0f, 0.0f, 0.0f)];
```

we finally add the cam and light into the eye.
```Objective-C
[self->eye addChild: self->cam];
[self->eye addChild: self->light];
```

We calculate and compare the maximum depth of the object on x-y-z to use it later to calculate the scale and the eye position.
```Objective-C
CGFloat maxDepth = MAX(
                       MAX(self->Dobj.boundingBox.maximum.z - self->Dobj.boundingBox.minimum.z,
                           self->Dobj.boundingBox.maximum.y - self->Dobj.boundingBox.minimum.y),
                       self->Dobj.boundingBox.maximum.x - self->Dobj.boundingBox.minimum.x);
```

We now calculate the scale(ratio), the maximum scale is 1 (original size of the object). Why divided by 8? Because.
We calculate the position of the cam to be at a distance of 2.5X the size of the object.
```Objective-C
CGFloat ratio = MIN(1.0f, (MIN(windowSize.height, windowSize.width)/maxDepth)/8);
CGFloat camZ = maxDepth*ratio*2.5;
```

We set the scale for the pins (this is just setting a variable for now).
We then render the pins using the previously setted scale.
```Objective-C
[self->pins setScale:ratio];
[self->pins renderPins];
```

We finnaly set the z position of the eye using the previously calculated camZ.
```Objective-C
[self->eye setLocation:cc3v(0.0f, 0.0f, camZ)];
```

We  set the location of the light to be a bit behind the eye.
We set the light to be directionnal the light intensity is not attenuated with the distance.
```Objective-C
[self->light setLocation:cc3v(0.0f, 0.0f, -1.0f)];
self->light.isDirectionalOnly = YES;
```

This is kind of a complex shit to set the object axis on the object center
```Objective-C
CC3Vector objCenter = self->Dobj.centerOfGeometry;
[self->container addChild:self->Dobj];
self->container.uniformScale = ratio;
CC3Vector maskOffset = CC3VectorScaleUniform(self->Dobj.location, self->container.uniformScale);
self->Dobj.location = CC3VectorDifference(maskOffset, objCenter);
```

The eye (containing the light and cam), and the container (containing the object and pins) are finally added to the scene.
```Objective-C
[self addChild: self->eye];
[self addChild: self->container];
```

Mandatory shit to add in the end
```Objective-C
[self createGLBuffers];
[self releaseRedundantContent];
```

We set the zoom speed, the translation speed and the rotation speed to some random (yet well working) values
```Objective-C
ZoomRate = maxDepth/2.5;
TranslationXYRate = maxDepth/600;
RotationXYRate = 1/1.7;
```


How are the pins processed
=================

 -  In Flare3D:
    big object -> `scale` to small -> user set new pin -> apply pin -> save pin coords without `scale`

    Pins are saved with a position and a rotation (we should try to save the real position instead of these two)

 -  In Cocos3D:
    big object -> `scale` to small -> apply previously saved pin with current `scale`

    Pins are set following these steps:
     - apply rotation on the container
     - set the pin at position
     - set the container back to its original rotation






