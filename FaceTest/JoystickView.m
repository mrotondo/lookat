//
//  JoystickView.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "JoystickView.h"

@implementation JoystickView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    CGContextRef c = [[NSGraphicsContext currentContext] CGContext];
    [[NSColor redColor] set];
    CGContextStrokeEllipseInRect(c, CGRectMake(self.bounds.size.width / 2.0 - self.deadZoneMagnitude / 2.0,
                                               self.bounds.size.height / 2.0 - self.deadZoneMagnitude / 2.0,
                                               self.deadZoneMagnitude, self.deadZoneMagnitude));
    
    float joystickCircleRadius = 10.0;
    [[NSColor yellowColor] set];
    CGContextFillEllipseInRect(c, CGRectMake(self.joystickPoint.x * self.bounds.size.width - joystickCircleRadius,
                                             self.joystickPoint.y * self.bounds.size.height - joystickCircleRadius,
                                             joystickCircleRadius * 2, joystickCircleRadius * 2));

}

@end
