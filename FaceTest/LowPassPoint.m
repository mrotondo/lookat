//
//  LowPassPoint.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "LowPassPoint.h"

@interface LowPassPoint ()

@property (nonatomic, assign) float decay;
@property (nonatomic, retain) NSDate *updateTime;
@property (nonatomic, assign) CGPoint currentValue;

@end

@implementation LowPassPoint

- (instancetype)initWithDecay:(float)decay
{
    self = [super init];
    if (self)
    {
        self.decay = decay;
        self.currentValue = CGPointZero;
        self.updateTime = [NSDate date];
    }
    return self;
}

- (instancetype)initWithDecay:(float)decay initialPoint:(CGPoint)initialPoint
{
    self = [self initWithDecay:decay];
    if (self)
    {
        self.currentValue = initialPoint;
    }
    return self;
}

- (void)updateWithCGPoint:(CGPoint)newValue
{
    NSDate *newUpdateTime = [NSDate date];
    NSTimeInterval deltaTime = [newUpdateTime timeIntervalSinceDate:self.updateTime];
    self.currentValue = CGPointMake(newValue.x + (self.currentValue.x - newValue.x) * exp(-self.decay * deltaTime),
                                    newValue.y + (self.currentValue.y - newValue.y) * exp(-self.decay * deltaTime));
    self.updateTime = newUpdateTime;
}

@end
