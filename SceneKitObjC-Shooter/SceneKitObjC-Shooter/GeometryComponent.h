//
//  GeometryComponent.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>

@interface GeometryComponent : GKComponent

@property (nonatomic,retain)SCNNode *node;

-(instancetype)initWithNode:(SCNNode *)node;

@end
