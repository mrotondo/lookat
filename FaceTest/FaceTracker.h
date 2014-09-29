//
//  FaceTracker.h
//  FaceTest
//
//  Created by Mike Rotondo on 9/28/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FaceTrackerDelegate.h"

@interface FaceTracker : NSObject

@property (nonatomic, weak) IBOutlet NSObject<FaceTrackerDelegate> *delegate;

@end
