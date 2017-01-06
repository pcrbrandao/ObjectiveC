//
//  PhysicComponent.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "PhysicsComponent.h"

@implementation PhysicsComponent

-(id)init {
    
    self = [super init];
    if (self) {
        _physicsBody = [SCNPhysicsBody bodyWithType:SCNPhysicsBodyTypeDynamic shape:nil];
    }
    return self;
}

@end
