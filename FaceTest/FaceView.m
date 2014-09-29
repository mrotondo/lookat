//
//  FaceView.m
//  FaceTest
//
//  Created by Logan Collins on 4/2/12.
//  Copyright (c) 2012 Panic, Inc. All rights reserved.
//

#import "FaceView.h"
#import "FaceLayer.h"
#import "FaceTrackerDelegate.h"
#import "FaceJoystick.h"
#import "JoystickLayer.h"

#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

@interface FaceView () <FaceTrackerDelegate>
@property (nonatomic, strong) FaceLayer *faceLayer;
@property (nonatomic, strong) FaceJoystick *faceJoystick;
@property (nonatomic, strong) JoystickLayer *joystickLayer;
@end

@implementation FaceView

- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setLayer:[CALayer layer]];
        [self setWantsLayer:YES];
        
        self.faceLayer = [[FaceLayer alloc] init];
        self.faceLayer.frame = self.bounds;
        [self.layer addSublayer:self.faceLayer];

        self.joystickLayer = [[JoystickLayer alloc] init];
        self.joystickLayer.frame = self.bounds;
        [self.layer addSublayer:self.joystickLayer];
        
        self.layer.backgroundColor = [NSColor orangeColor].CGColor;
        
        self.faceJoystick = [[FaceJoystick alloc] initWithDeadZoneMagnitude:200.0];
    }
    return self;
}

- (void)faceTracker:(FaceTracker *)faceTracker createdCaptureSession:(AVCaptureSession *)captureSession
{
    CALayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
    previewLayer.frame = self.bounds;
    [self.layer insertSublayer:previewLayer below:self.faceLayer];
}

- (void)faceTracker:(FaceTracker *)faceTracker updatedWithFaces:(NSArray *)faces fromImageOfSize:(CGSize)imageSize
{
    self.faceLayer.imageSize = imageSize;
    self.faceLayer.faces = faces;
    
    [self.faceJoystick updateWithFaces:faces fromImageOfSize:imageSize];
    
    self.joystickLayer.deadZoneMagnitude = self.faceJoystick.deadZoneMagnitude;
    self.joystickLayer.joystickPoint = self.faceJoystick.currentPoint;
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.faceLayer setNeedsDisplay];
        [self.joystickLayer setNeedsDisplay];
    });
}

@end
