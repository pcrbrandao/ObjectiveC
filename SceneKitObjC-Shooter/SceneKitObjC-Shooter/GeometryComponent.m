//
//  GeometryComponent.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GeometryComponent.h"

@implementation GeometryComponent

-(instancetype)initWithNode:(SCNNode *)node {
    self = [super init];
    if (self) {
        _node = node;
    }
    
    return self;
}

@end
