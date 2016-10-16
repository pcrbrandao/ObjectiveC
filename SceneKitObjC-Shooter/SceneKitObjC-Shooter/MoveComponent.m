//
//  MoveComponent.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "MoveComponent.h"
#import "GeometryComponent.h"

@interface MoveComponent()

-(GeometryComponent *)getGeometryComponent;

@end

@implementation MoveComponent

-(instancetype)initWithMaxSpeed:(CGFloat)maxSpeed MaxAcceleration:(CGFloat)maxAccell andRadius:(CGFloat)radius {
    
    self = [super init];
    if (self) {
        self.delegate = self;
        self.maxSpeed = maxSpeed;
        self.maxAcceleration = maxAccell;
        self.radius = radius;
        self.mass = 0.01;
    }
    return self;
}

-(void)agentWillUpdate:(GKAgent *)agent {
    if (self.getGeometryComponent) {
        self.position = vector2(self.getGeometryComponent.node.position.x
                                , self.getGeometryComponent.node.position.y);
    }
}

-(void)agentDidUpdate:(GKAgent *)agent {
    if (self.getGeometryComponent) {
        self.getGeometryComponent.node.position = SCNVector3Make(self.position.x, 0.0f, self.position.y);
    }
}

-(GeometryComponent *)getGeometryComponent {
    GeometryComponent *component = nil;
    
    if ([self entity]) {
        if ([self.entity componentForClass:GeometryComponent.self]) {
            component = (GeometryComponent *)[self.entity componentForClass:GeometryComponent.self];
        }
    }
    return component;
}

@end
