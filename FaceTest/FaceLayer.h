//
//  FaceLayer.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/21/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FaceLayer : CALayer

@property (nonatomic, strong) NSArray *faces;
@property (nonatomic, assign) CGSize imageSize;

@end
