//
//  GeometryComponent.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GeometryComponent.h"

@implementation GeometryComponent

-(id)initWithGeometry:(SCNGeometry *)geometry {
    
    self = [super init];
    if (self) {
        _geometryNode = [SCNNode nodeWithGeometry:geometry];
    }
    return self;
}

@end
