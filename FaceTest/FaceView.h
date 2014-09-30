//
//  FaceView.h
//  FaceTest
//
//  Created by Logan Collins on 4/2/12.
//  Copyright (c) 2012 Panic, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AVCaptureSession;

@interface FaceView : NSView

@property (nonatomic, assign) CGSize captureImageSize;
@property (nonatomic, strong) NSArray *faces;

- (void)setPreviewLayerWithCaptureSession:(AVCaptureSession *)captureSession;

@end
