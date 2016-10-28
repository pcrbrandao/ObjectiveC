//
//  GameController.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import "MainScene.h"
#import "PlayerEntity.h"

@interface GameController : NSObject<SCNSceneRendererDelegate>

@property (nonatomic,retain)MainScene *scene;
@property (nonatomic,retain)PlayerEntity *player;

-(void)handleTapGesture:(UITapGestureRecognizer *)tap inView:(SCNView *)view;

+(GameController *)sharedController;

@end
