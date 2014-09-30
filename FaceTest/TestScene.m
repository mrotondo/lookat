//
//  TestScene.m
//  FaceTest
//
//  Created by Mike Rotondo on 9/30/14.
//  Copyright (c) 2014 Panic, Inc. All rights reserved.
//

#import "TestScene.h"

@implementation TestScene

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        SCNCamera *camera = [SCNCamera camera];
        SCNNode *cameraNode = [SCNNode node];
        cameraNode.camera = camera;
        cameraNode.position = SCNVector3Make(0, 0, 10);
        
        SCNNode *cubeNode = [SCNNode node];
        cubeNode.geometry = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0.2];
        
        SCNLight *light = [SCNLight light];
        SCNNode *lightNode = [SCNNode node];
        lightNode.light = light;
        lightNode.position = SCNVector3Make(5, 0, 10);
        
        [self.rootNode addChildNode:cameraNode];
        [self.rootNode addChildNode:cubeNode];
        [self.rootNode addChildNode:lightNode];
    }
    return self;
}

@end
