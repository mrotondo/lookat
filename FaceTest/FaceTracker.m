//
//  FaceTracker.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "FaceTracker.h"
#import <AVFoundation/AVFoundation.h>

@interface FaceTracker () <AVCaptureVideoDataOutputSampleBufferDelegate>
@property (nonatomic, strong) CIDetector *faceDetector;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoOutput;
@property (nonatomic, strong) AVCaptureDevice *videoCaptureDevice;
@property (nonatomic, assign) dispatch_queue_t videoDataQueue;
@end

@implementation FaceTracker

- (void)awakeFromNib
{
    self.faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace
                                           context:nil
                                           options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    
    self.captureSession = [[AVCaptureSession alloc] init];
    self.videoCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    self.videoInput = [AVCaptureDeviceInput deviceInputWithDevice:self.videoCaptureDevice error:&error];
    if (self.videoInput) {
        [self.captureSession addInput:self.videoInput];
    }
    else {
        // Handle the failure.
    }
    
    self.videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    self.videoDataQueue = dispatch_queue_create("videoData", DISPATCH_QUEUE_SERIAL);
    [self.videoOutput setSampleBufferDelegate:self queue:self.videoDataQueue];
    [self.captureSession addOutput:self.videoOutput];
    
    [self.captureSession startRunning];
    
    [self.delegate faceTracker:self createdCaptureSession:self.captureSession];
}

- (void)dealloc {
    dispatch_release(self.videoDataQueue);
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection
{
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CIImage *image = [[CIImage alloc] initWithCVImageBuffer:imageBuffer];
    NSArray *faces = [self.faceDetector featuresInImage:image];
    [self.delegate faceTracker:self updatedWithFaces:faces fromImageOfSize:CVImageBufferGetDisplaySize(imageBuffer)];
}

@end
