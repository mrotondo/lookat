//
//  FaceJoystick.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "FaceJoystick.h"
#import "LowPassPoint.h"
#import <QuartzCore/QuartzCore.h>

@interface FaceJoystick ()

@property (nonatomic, strong) LowPassPoint *joystickPoint;
@property (nonatomic, assign) float deadZoneMagnitude;

@end

@implementation FaceJoystick

- (instancetype)initWithDeadZoneMagnitude:(float)deadZoneMagnitude
{
    self = [super init];
    if (self) {
        self.joystickPoint = [[LowPassPoint alloc] initWithDecay:8.0 initialPoint:CGPointMake(0.5, 0.5)];
        self.deadZoneMagnitude = deadZoneMagnitude;
    }
    return self;
}

- (void)updateWithFaces:(NSArray *)faces fromImageOfSize:(CGSize)imageSize
{
    if (faces.count > 0)
    {
        CIFaceFeature *face = faces[0];
        if (face.hasLeftEyePosition && face.hasRightEyePosition) {
            CGPoint leftEyePosition = face.leftEyePosition;
            CGPoint rightEyePosition = face.rightEyePosition;
            // Normalize the centroid so that our joystick point is always in [0, 1]
            CGPoint centroid = CGPointMake(((leftEyePosition.x + rightEyePosition.x) / 2.0) / imageSize.width,
                                           ((leftEyePosition.y + rightEyePosition.y) / 2.0) / imageSize.height);
            [self.joystickPoint updateWithCGPoint:centroid];
        }
    }
}

- (CGPoint)currentPoint
{
    return self.joystickPoint.currentValue;
}

@end
