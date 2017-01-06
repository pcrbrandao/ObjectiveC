//
//  ShapeEntity.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ShapeEntity.h"
#import "TestesSceneKit-Swift.h"

@implementation ShapeEntity

#pragma mark Propriedades

-(SCNNode *)geometryNode {
    
    if (!_geometryNode) {
        _geometryNode = self.geometryComponent.geometryNode;
        
        [_geometryNode setPhysicsBody:self.physicsComponent.physicsBody];
        [_geometryNode addParticleSystem:self.particleComponent.particle];
        
        [ShapeEntity applyRandomForcesInNode:_geometryNode];
        
        if (self.color == [UIColor blackColor]) {
            _geometryNode.name = @"BAD";
        } else {
            _geometryNode.name = @"GOOD";
        }
    }
    
    return _geometryNode;
}

-(UIColor *)color {
    if (!_color) {
        _color = [UIColor random];
    }
    return _color;
}

-(SCNGeometry *)geometry {
    if (!_geometry) {
        _geometry = [self geometryWithShape:self.shape];
    }
    return _geometry;
}

-(GeometryComponent *)geometryComponent {
    if (!_geometryComponent) {
        _geometryComponent = [[GeometryComponent alloc] initWithGeometry:self.geometry];
    }
    return _geometryComponent;
}

-(PhysicsComponent *)physicsComponent {
    if (!_physicsComponent) {
        _physicsComponent = [[PhysicsComponent alloc] init];
    }
    return _physicsComponent;
}

-(ParticleComponent *)particleComponent {
    if (!_particleComponent) {
        _particleComponent = [[ParticleComponent alloc] initWithColor:self.color andGeometry:self.geometry];
    }
    return _particleComponent;
}

#pragma mark Métodos

-(id)initWithShape:(ShapeType)shape {
    
    self = [super init];
    if (self) {
        _shape = shape;
        
        [self addComponent:self.geometryComponent];
        [self addComponent:self.physicsComponent];
        [self addComponent:self.particleComponent];
    }
    return self;
}

-(SCNGeometry *)geometryWithShape:(ShapeType)shape {
    
    SCNGeometry *geometry;
    switch (shape) {
        case 0:
            geometry = [SCNBox boxWithWidth:1.0 height:1.0 length:1.0 chamferRadius:0.0];
            break;
        case 1:
            geometry = [SCNSphere sphereWithRadius:0.5];
            break;
        case 2:
            geometry = [SCNPyramid pyramidWithWidth:1.0 height:1.0 length:1.0];
            break;
        case 3:
            geometry = [SCNTorus torusWithRingRadius:1.0 pipeRadius:0.75];
            break;
        case 4:
            geometry = [SCNCapsule capsuleWithCapRadius:0.25 height:1.0];
            break;
        case 5:
            geometry = [SCNCylinder cylinderWithRadius:0.5 height:1.0];
            break;
        case 6:
            geometry = [SCNCone coneWithTopRadius:0.0 bottomRadius:1.0 height:1.0];
            break;
        case 7:
            geometry = [SCNTube tubeWithInnerRadius:0.25 outerRadius:1.0 height:1.0];
            break;
        default:
            break;
    }
    if (geometry.materials.firstObject) {
        [geometry.materials.firstObject.diffuse setContents:self.color];
    }
    return geometry;
}

+(UIColor *)randomColor {
    GKRandomDistribution *randomColor = [GKRandomDistribution distributionWithLowestValue:0 highestValue:255];
    
    float red = [randomColor nextInt]/255.0;
    float green = [randomColor nextInt]/255.0;
    float blue = [randomColor nextInt]/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+(void)applyRandomForcesInNode:(SCNNode *)node {
    
    GKRandomDistribution *randomDistX = [GKRandomDistribution distributionWithLowestValue:-200 highestValue:200];
    GKRandomDistribution *randomDistY = [GKRandomDistribution distributionWithLowestValue:1000 highestValue:1800];
    
    float randomX = [randomDistX nextInt] / 100;
    float randomY = [randomDistY nextInt] / 100;
    
    SCNVector3 force = SCNVector3Make(randomX, randomY, 0.0);
    SCNVector3 position = SCNVector3Make(0.05, 0.05, 0.05);
    
    [node.physicsBody applyForce:force atPosition:position impulse:YES];
}

@end
