//
//  FaceNavViewController.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "FaceNavViewController.h"
#import "FaceView.h"
#import "JoystickView.h"
#import "FaceJoystick.h"
#import "FaceTrackerDelegate.h"

@interface FaceNavViewController () <FaceTrackerDelegate>

@property (nonatomic, strong) IBOutlet FaceView *faceView;
@property (nonatomic, strong) IBOutlet JoystickView *joystickView;
@property (nonatomic, strong) FaceJoystick *faceJoystick;

@end

@implementation FaceNavViewController

- (void)awakeFromNib
{
//    [[NSApplication sharedApplication] setNextResponder:self];
//    [self becomeFirstResponder];
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

- (void)viewDidLoad
{
    self.faceJoystick = [[FaceJoystick alloc] initWithDeadZoneMagnitude:100.0];
    self.joystickView.joystick = self.faceJoystick;
}

- (void)faceTracker:(FaceTracker *)faceTracker createdCaptureSession:(AVCaptureSession *)captureSession
{
    [self.faceView setPreviewLayerWithCaptureSession:captureSession];
}

- (void)faceTracker:(FaceTracker *)faceTracker updatedWithFaces:(NSArray *)faces fromImageOfSize:(CGSize)captureImageSize
{
    self.faceView.captureImageSize = captureImageSize;
    self.faceView.faces = faces;
    
    [self.faceJoystick updateWithFaces:faces fromImageOfSize:captureImageSize];
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.faceView setNeedsDisplay:YES];
        [self.joystickView setNeedsDisplay:YES];
    });
}

@end
