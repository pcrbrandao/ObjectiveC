//
//  GameScene.h
//  RogueLikeObjC
//

//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PlayerEntity.h"

@interface GameScene : SKScene

@property (nonatomic,retain)PlayerEntity *player;

@end
