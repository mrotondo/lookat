//
//  AppDelegate.m
//  FaceTest
//
//  Created by Logan Collins on 4/2/12.
//  Copyright (c) 2012 Panic, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <Quartz/Quartz.h>
#import <AVFoundation/AVFoundation.h>

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    [[self window] makeKeyAndOrderFront:nil];
    return YES;
}

@end
