//
//  FaceJoystick.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FaceJoystick : NSObject

@property (nonatomic, readonly) CGPoint currentPoint;
@property (nonatomic, readonly) float deadZoneMagnitude;
@property (nonatomic, readonly) CGPoint center;

- (instancetype)initWithDeadZoneMagnitude:(float)deadZoneMagnitude;
- (void)updateWithFaces:(NSArray *)faces fromImageOfSize:(CGSize)imageSize;
- (void)setCenterToCurrentPoint;

@end
