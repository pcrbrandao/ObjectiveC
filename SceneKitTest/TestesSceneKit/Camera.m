//
//  Camera.m
//  TestesSceneKit
//
//  Created by Pedro Brandão on 31/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Camera.h"

@implementation Camera

-(CameraComponent *)cameraComponent {
    if (!_cameraComponent) {
        _cameraComponent = [[CameraComponent alloc] init];
    }
    return _cameraComponent;
}

-(id)init {
    self = [super init];
    if (self) {
        [self addComponent:self.cameraComponent];
    }
    return self;
}

@end
