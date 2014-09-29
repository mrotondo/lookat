//
//  FaceTrackerDelegate.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#ifndef FaceTest_FaceTrackerDelegate_h
#define FaceTest_FaceTrackerDelegate_h

@class AVCaptureSession;
@class FaceTracker;
@class NSArray;

@protocol FaceTrackerDelegate <NSObject>

- (void)faceTracker:(FaceTracker *)faceTracker createdCaptureSession:(AVCaptureSession *)captureSession;
- (void)faceTracker:(FaceTracker *)faceTracker updatedWithFaces:(NSArray *)faces fromImageOfSize:(CGSize)imageSize;

@end

#endif
