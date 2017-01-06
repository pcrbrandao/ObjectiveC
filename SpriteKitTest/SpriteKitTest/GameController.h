//
//  GameController.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 03/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"
#import "GameType.h"

@protocol GameControllerProtocol;

@interface GameController : NSObject

@property (nonatomic,assign) int highScore;
@property (nonatomic,assign) int gameScore;
@property (nonatomic,assign) int levelNumber;
@property (nonatomic,assign) int livesNumber;
@property (nonatomic,assign) GameState gameState;

-(void)loseALiveInScene:(SKScene *)scene;
-(void)addScoreInScene:(SKScene *)scene;
-(void)spawnExplosionInScene:(SKScene *)scene At:(CGPoint)point;
// -(void)removeBodies:(NSArray<SKPhysicsBody *> *) bodies;
-(void)startNewLevelInScene:(SKScene *)scene;
-(void)runGameOverInScene:(SKScene *)scene;

-(void)contato:(SKPhysicsContact *)contato NaScene:(SKScene *)scene;
-(void)player:(SKPhysicsBody *)player HitEnemy:(SKPhysicsBody *)enemy InScene:(SKScene *)scene;
-(void)bullet:(SKPhysicsBody *)bullet HitEnemy:(SKPhysicsBody *)enemy InScene:(SKScene *)scene;
-(BOOL)playerInBodies:(NSArray<SKPhysicsBody *> *)bodies InScene:(SKScene *)scene;
-(void)enemyInBodies:(NSArray<SKPhysicsBody *> *)bodies InScene:(SKScene *)scene;

+(GameController *)sharedController;

@end

@protocol GameControllerProtocol <NSObject>

-(void)gameController:(GameController *)controller mudarParaScene:(SKScene *)scene;

@end