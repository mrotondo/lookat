//
//  FaceLayer.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/21/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "FaceLayer.h"

@implementation FaceLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [NSColor clearColor].CGColor;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)c
{
    // Create an NSImage representation of the image
    CGFloat scaleFactor = 1.0;
    
    CGSize targetSize = NSSizeToCGSize([self bounds].size);
    CGSize imageSize = self.imageSize;
    
    CGFloat widthDelta = imageSize.width - targetSize.width;
    CGFloat heightDelta = imageSize.height - targetSize.height;
    
    if (widthDelta >= heightDelta) {
        // Scale to width
        scaleFactor = targetSize.width / imageSize.width;
    }
    else {
        // Scale to height
        scaleFactor = targetSize.height / imageSize.height;
    }
    
    // Iterate the detected faces
    for (CIFaceFeature *face in _faces) {
        // Get the bounding rectangle of the face
        CGRect bounds = face.bounds;
        
        [[NSColor redColor] set];
        CGContextStrokeRect(c, CGRectMake(bounds.origin.x * scaleFactor, bounds.origin.y * scaleFactor, bounds.size.width * scaleFactor, bounds.size.height * scaleFactor));
        
        // Get the position of facial features
        if (face.hasLeftEyePosition) {
            CGPoint leftEyePosition = face.leftEyePosition;
            
            [[NSColor blueColor] set];
            CGContextStrokeRect(c, CGRectMake(leftEyePosition.x * scaleFactor - 10.0, leftEyePosition.y * scaleFactor - 10.0, 20.0, 20.0));
        }
        
        if (face.hasRightEyePosition) {
            CGPoint rightEyePosition = face.rightEyePosition;
            
            [[NSColor blueColor] set];
            CGContextStrokeRect(c, CGRectMake(rightEyePosition.x * scaleFactor - 10.0, rightEyePosition.y * scaleFactor - 10.0, 20.0, 20.0));
        }
        
        if (face.hasMouthPosition) {
            CGPoint mouthPosition = face.mouthPosition;
            
            [[NSColor blueColor] set];
            CGContextStrokeRect(c, CGRectMake(mouthPosition.x * scaleFactor - 10.0, mouthPosition.y * scaleFactor - 10.0, 20.0, 20.0));
        }
    }
}

@end
