//
//  GameScene.h
//  SpriteKitTest
//

//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Player.h"
#import "Background.h"
#import "Bullet.h"

@class GameController;
@class GameLabel;

@interface GameScene : SKScene<SKPhysicsContactDelegate>

@property (nonatomic,retain) Player *player;
@property (nonatomic,retain) Background *background;
@property (nonatomic,retain) GameLabel *livesLabel;
@property (nonatomic,retain) GameLabel *scoreLabel;
@property (nonatomic,retain) SKAction *explosionSound;
@property (nonatomic,retain) SKAction *bulletSound;
@property (nonatomic,retain) GameController *gameController;

-(CGRect)gameArea;

@end
