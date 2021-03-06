//
//  GeometryComponent.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>

@interface GeometryComponent : GKComponent

@property (nonatomic, retain)SCNNode *geometryNode;

-(id)initWithGeometry:(SCNGeometry *)geometry;

@end
