//
//  PlayerEnity.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameplayKit/GameplayKit.h>
#import "GeometryComponent.h"
#import "MoveComponent.h"

@interface PlayerEntity : GKEntity

@property (nonatomic,retain)GeometryComponent *geometryComponent;
@property (nonatomic,retain)MoveComponent *moveComponent;

-(instancetype)initWithScene:(SCNScene *)scene andNode:(SCNNode *)node;

@end
