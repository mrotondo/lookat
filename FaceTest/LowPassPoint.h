//
//  LowPassPoint.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LowPassPoint : NSObject

@property (nonatomic, readonly) CGPoint currentValue;

- (instancetype)initWithDecay:(float)decay;
- (instancetype)initWithDecay:(float)decay initialPoint:(CGPoint)initialPoint;
- (void)updateWithCGPoint:(CGPoint)newValue;

@end
