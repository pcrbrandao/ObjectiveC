//
//  MoveComponent.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>
#import <UIKit/UIKit.h>

@interface MoveComponent : GKComponent

-(instancetype)initWithNode: (SCNNode *)node;

-(void)moveWithTap:(UITapGestureRecognizer *)tap inView:(SCNView *)view;

@end
