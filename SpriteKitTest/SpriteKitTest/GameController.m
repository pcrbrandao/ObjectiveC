//
//  GameController.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 03/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameController.h"
#import "Explosao.h"
#import "Enemy.h"
#import "GameLabel.h"
#import "GameOverScene.h"

@implementation GameController

static GameController *sharedController = nil;

+(GameController *)sharedController {
    if (!sharedController) {
        sharedController = [[GameController alloc] init];
        [sharedController setLevelNumber:0];
        [sharedController setLivesNumber:3];
        [sharedController setGameState:GameStateRunning];
    }
    return sharedController;
}

-(int)highScore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _highScore = [defaults integerForKey:@"highScoreSaved"];
    if (self.gameScore > _highScore) {
        _highScore = self.gameScore;
        [defaults setInteger:_highScore forKey:@"highScoreSaved"];
    }
    return _highScore;
}

-(void)runGameOverInScene:(GameScene<GameControllerProtocol> *)scene {
    
    [scene.gameController setGameState:GameStateEnded];
    
    [scene removeAllActions];
    [scene enumerateChildNodesWithName:@"Bullet" usingBlock:^(SKNode *node, BOOL *stop) {
        [node removeAllActions];
    }];
    [scene enumerateChildNodesWithName:@"Enemy" usingBlock:^(SKNode *node, BOOL *stop){
        [node removeAllActions];
    }];
    
    SKAction *changeSceneAction = [SKAction runBlock:^{ [scene gameController:self mudarParaScene:[GameOverScene sceneWithSize:scene.size]]; }];
    SKAction *waitToChangeScene = [SKAction waitForDuration:1];
    SKAction *changeSceneSequence = [SKAction sequence:@[waitToChangeScene,changeSceneAction]];
    [scene runAction:changeSceneSequence];
}

-(void)loseALiveInScene:(GameScene<GameControllerProtocol> *)scene {
    
    self.livesNumber--;
    scene.livesLabel.text = [NSString stringWithFormat:@"Lives: %d", self.livesNumber];
    
    SKAction *scaleUp = [SKAction scaleTo:1.5 duration:0.2];
    SKAction *scaleDown = [SKAction scaleTo:1 duration:0.2];
    SKAction *scaleSequence = [SKAction sequence:@[scaleUp, scaleDown]];
    [scene.livesLabel runAction:scaleSequence];
    
    if (self.livesNumber == 0) {
        [scene gameController:self mudarParaScene:[GameOverScene sceneWithSize:scene.size]];
    }
}

-(void)addScoreInScene:(GameScene *)scene {
    self.gameScore++;
    scene.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.gameScore];
    
    if (self.gameScore == 10 || self.gameScore == 25 || self.gameScore == 50) {
        [self startNewLevelInScene:scene];
    }
}

-(void)spawnExplosionInScene:(GameScene *)scene At:(CGPoint)point {
    Explosao *explosao = [[Explosao alloc] initWithPoint:point];
    [scene addChild:explosao];
    [explosao runAction:scene.explosionSound];
    [explosao runAction:explosao.sequence];
}

-(void)removeBodies:(NSArray<SKPhysicsBody *> *) bodies {
    if (bodies && bodies.count == 2) {
        if (bodies[0].node) { [bodies[0].node removeFromParent]; }
        if (bodies[1].node) { [bodies[1].node removeFromParent]; }
    }
}

-(void)startNewLevelInScene:(GameScene *)scene {
    
    self.levelNumber++;
    
    if (![scene actionForKey:@"spawningEnemies"]) {
        [scene removeActionForKey:@"spawningEnemies"];
    }
    
    NSTimeInterval levelDuration = 0;
    
    switch (self.levelNumber) {
        case 1: levelDuration = 1.2; break;
        case 2: levelDuration = 1; break;
        case 3: levelDuration = 0.8; break;
        case 4: levelDuration = 0.5; break;
        default:
            levelDuration = 0.5;
            NSLog(@"Can't find level info");
            break;
    }
    
    SKAction *spawn = [SKAction runBlock:^ { [Enemy spawnInScene:scene]; }];
    SKAction *waitToSpawn = [SKAction waitForDuration:levelDuration];
    SKAction *spawnSequence = [SKAction sequence:@[waitToSpawn,spawn]];
    SKAction *spawnForever = [SKAction repeatActionForever:spawnSequence];
    [scene runAction:spawnForever withKey:@"spawningEnemies"];
}

-(NSArray<SKPhysicsBody *> *)sortedBodiesInContact:(SKPhysicsContact *)contact {
    
    SKPhysicsBody *body1;
    SKPhysicsBody *body2;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        body1 = contact.bodyA;
        body2 = contact.bodyB;
    } else {
        body1 = contact.bodyB;
        body2 = contact.bodyA;
    }
    return @[body1,body2];
}

-(BOOL)playerInBodies:(NSArray<SKPhysicsBody *> *)bodies InScene:(GameScene *)scene {
    
    if (bodies[0].categoryBitMask == PhysicsCategoryPlayer &&
        bodies[1].categoryBitMask == PhysicsCategoryEnemy) {
        
        [self player:bodies[0] HitEnemy:bodies[1] InScene:scene];
        return YES;
    } else {
        return NO;
    }
}

-(void)enemyInBodies:(NSArray<SKPhysicsBody *> *)bodies InScene:(GameScene *)scene {
    
    if (bodies[0].categoryBitMask == PhysicsCategoryBullet &&
        bodies[1].categoryBitMask == PhysicsCategoryEnemy) {
    
        [self bullet:bodies[0] HitEnemy:bodies[1] InScene:scene];
    }
}

-(void)bullet:(SKPhysicsBody *)bullet HitEnemy:(SKPhysicsBody *)enemy InScene:(GameScene *)scene {
    
    if(bullet.node) { [self spawnExplosionInScene:scene At:[bullet.node position]]; }
    [self addScoreInScene:scene];
}

-(void)player:(SKPhysicsBody *)player HitEnemy:(SKPhysicsBody *)enemy InScene:(GameScene<GameControllerProtocol> *)scene {

    [self loseALiveInScene:scene];
    if(player.node) { [self spawnExplosionInScene:scene At:[player.node position]]; }
    if(enemy.node) { [self spawnExplosionInScene:scene At:[enemy.node position]]; }
    [self runGameOverInScene:scene];
}

-(void)contato:(SKPhysicsContact *)contato NaScene:(GameScene *)scene {
    
    NSArray<SKPhysicsBody *> *bodies = [self sortedBodiesInContact:contato];
    if (![self playerInBodies:bodies InScene:scene]) {
        [self enemyInBodies:bodies InScene:scene];
    }
    [self removeBodies:bodies];
}

@end
