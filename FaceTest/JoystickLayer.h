//
//  JoystickLayer.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/29/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface JoystickLayer : CALayer

@property (nonatomic, assign) float deadZoneMagnitude;
@property (nonatomic, assign) CGPoint joystickPoint;

@end
