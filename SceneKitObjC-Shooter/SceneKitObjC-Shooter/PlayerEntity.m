//
//  PlayerEnity.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "PlayerEntity.h"

@implementation PlayerEntity

-(instancetype)initWithScene:(SCNScene *)scene andNode:(SCNNode *)node {
    self = [super init];
    if (self) {
        _geometryComponent = [[GeometryComponent alloc] initWithNode:node];
        _moveComponent = [[MoveComponent alloc] initWithNode:node];
        [self addComponent:_geometryComponent];
        [self addComponent:_moveComponent];
    }
    return self;
}

@end
