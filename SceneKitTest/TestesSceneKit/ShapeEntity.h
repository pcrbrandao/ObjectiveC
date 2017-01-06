//
//  ShapeEntity.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>
#import "ShapeTypes.h"
#import "GeometryComponent.h"
#import "PhysicsComponent.h"
#import "ParticleComponent.h"

@interface ShapeEntity : GKEntity

@property (nonatomic,retain)SCNNode *geometryNode;
@property (nonatomic,retain)SCNGeometry *geometry;
@property (nonatomic,retain)UIColor *color;
@property (nonatomic,assign)ShapeType shape;

@property (nonatomic,retain)GeometryComponent *geometryComponent;
@property (nonatomic,retain)PhysicsComponent *physicsComponent;
@property (nonatomic,retain)ParticleComponent *particleComponent;

-(id)initWithShape:(ShapeType)shape;

+(UIColor *)randomColor;
+(void)applyRandomForcesInNode:(SCNNode *)node;

@end
