//
//  CameraComponent.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "CameraComponent.h"

@implementation CameraComponent

-(id)init {
    self = [super init];
    if (self) {
        _cameraNode = [SCNNode node];
        _cameraNode.camera = [SCNCamera camera];
        _cameraNode.position = SCNVector3Make(0, 5, 10);
    }
    return self;
}

@end
