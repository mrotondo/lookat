//
//  JoystickView.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class FaceJoystick;

@interface JoystickView : NSView

@property (nonatomic, strong) FaceJoystick *joystick;

@end
