//
//  GameScene.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameScene.h"
#import "CameraComponent.h"

@implementation GameScene

-(Camera *)camera {
    if (!_camera) {
        _camera = [[Camera alloc] init];
    }
    return _camera;
}

#pragma mark Sobrescritos

-(id)init {
    self = [super init];
    if (self) {
        [self.background setContents:@"GeometryFighter.scnassets/Textures/Background_Diffuse.png"];
        [self.rootNode addChildNode:self.camera.cameraComponent.cameraNode];
    }
    return self;
}

@end
