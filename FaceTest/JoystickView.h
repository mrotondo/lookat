//
//  JoystickView.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JoystickView : NSView

@property (nonatomic, assign) float deadZoneMagnitude;
@property (nonatomic, assign) CGPoint joystickPoint;

@end
