//
//  Jogo.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>
#import "GameScene.h"
#import "TestesSceneKit-Swift.h"

@interface Jogo : NSObject<SCNSceneRendererDelegate>

@property (nonatomic,retain) SCNScene *scene;
@property (nonatomic,retain) NSMutableArray<GKEntity *> *entities;
@property (nonatomic,assign) NSTimeInterval spawnTime;

@property (nonatomic,retain) GameHelper *gameHUD;

-(void)handleTouches:(NSSet<UITouch *> *)touches inView:(SCNView *)scnView;

@end
