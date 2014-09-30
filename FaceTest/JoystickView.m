//
//  JoystickView.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "JoystickView.h"
#import "FaceJoystick.h"
#import "AppDelegate.h"
#import <Carbon/Carbon.h>

@implementation JoystickView

- (BOOL)acceptsFirstResponder
{
    return YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    CGContextRef c = [[NSGraphicsContext currentContext] CGContext];
    [[NSColor redColor] set];
    CGRect circleRect = CGRectMake(self.joystick.center.x * self.bounds.size.width - self.joystick.deadZoneMagnitude / 2.0,
                                   self.joystick.center.y * self.bounds.size.height - self.joystick.deadZoneMagnitude / 2.0,
                                   self.joystick.deadZoneMagnitude, self.joystick.deadZoneMagnitude);
    CGContextStrokeEllipseInRect(c, circleRect);
    
    float joystickCircleRadius = 10.0;
    [[NSColor yellowColor] set];
    CGContextFillEllipseInRect(c, CGRectMake(self.joystick.currentPoint.x * self.bounds.size.width - joystickCircleRadius,
                                             self.joystick.currentPoint.y * self.bounds.size.height - joystickCircleRadius,
                                             joystickCircleRadius * 2, joystickCircleRadius * 2));

}

- (void)mouseDown:(NSEvent *)theEvent
{
}

- (void)keyDown:(NSEvent *)theEvent
{
    if (theEvent.keyCode == kVK_Return)
    {
        [self.joystick setCenterToCurrentPoint];
    }
}

@end
