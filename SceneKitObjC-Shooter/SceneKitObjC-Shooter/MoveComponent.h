//
//  MoveComponent.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <UIKit/UIKit.h>

@interface MoveComponent : GKAgent2D<GKAgentDelegate>

-(instancetype)initWithMaxSpeed:(CGFloat)maxSpeed MaxAcceleration:(CGFloat)maxAccell andRadius:(CGFloat)radius;

@end
