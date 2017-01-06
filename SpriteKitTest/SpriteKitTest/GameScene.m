//
//  GameScene.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import "GameScene.h"
#import <GameplayKit/GameplayKit.h>
#import "Enemy.h"
#import "GameType.h"
#import "Explosao.h"
#import "GameLabel.h"
#import "GameOverScene.h"
#import "GameController.h"
#import <math.h>

@implementation GameScene

-(CGRect)gameArea {
    CGFloat ratioWidth = CGRectGetMaxX([[UIScreen mainScreen] bounds]);
    CGFloat ratioHeight = CGRectGetMaxY([[UIScreen mainScreen] bounds]);
    CGFloat maxAspectRatio = ratioHeight/ratioWidth;
    
    CGFloat playableWidth = self.size.height / maxAspectRatio;
    CGFloat margin = (self.size.width - playableWidth) / 2;
    return CGRectMake(margin, 0, playableWidth, self.size.height);
}
 
#pragma mark Propriedades

-(Background *)background {
    if (!_background) {
        _background = [[Background alloc] initWithScene:self];
    }
    return _background;
}

-(Player *)player {
    if (!_player) {
        _player = [[Player alloc] initWithSCene:self];
    }
    return _player;
}

-(SKAction *)bulletSound {
    if (!_bulletSound) {
        _bulletSound = [SKAction playSoundFileNamed:@"shoot.wav" waitForCompletion:NO];
    }
    return _bulletSound;
}

-(SKAction *)explosionSound {
    if (!_explosionSound) {
        _explosionSound = [SKAction playSoundFileNamed:@"bang.wav" waitForCompletion:NO];
    }
    return _explosionSound;
}

-(GameLabel *)scoreLabel {
    
    if (!_scoreLabel) {
        _scoreLabel = [[GameLabel alloc] initWithTexto:@"Score: 0" alinhadoA:SKLabelHorizontalAlignmentModeLeft];
        [_scoreLabel setPosition:CGPointMake(self.size.width*0.15, self.size.height*0.9)];
    }
    return _scoreLabel;
}

-(GameLabel *)livesLabel {

    if (!_livesLabel) {
        _livesLabel = [[GameLabel alloc] initWithTexto:@"Lives: 3" alinhadoA:SKLabelHorizontalAlignmentModeRight];
        [_livesLabel setPosition:CGPointMake(self.size.width*0.85, self.size.height*0.9)];
    }
    return _livesLabel;
}

-(GameController *)gameController {
    if (!_gameController) {
        _gameController = [GameController sharedController];
    }
    return _gameController;
}

#pragma mark Sobrepostos

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    
    self.physicsWorld.contactDelegate = self;
    _bulletSound = [self bulletSound];
    _explosionSound = [self explosionSound];
    
    [self.background addBackgroundsInScene:self];
    [self addChild:self.player];
    [self addChild:self.scoreLabel];
    [self addChild:self.livesLabel];

    [self.gameController startNewLevelInScene:self];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self.background animateInScene:self WithTime:currentTime];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.gameController.gameState==GameStateRunning) {
        [self runAction:self.bulletSound];
        Bullet *bullet = [[Bullet alloc] initWithSprite:self.player
                                                  Scene:self
                                          andImageNamed:@"bullet"];
        [bullet setName:@"Bullet"];
        [self addChild:bullet];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.gameController.gameState==GameStateRunning) {
        [self.player touchesMoved:touches InScene:self];
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact {
    
    [_gameController contato:contact NaScene:self];
}

-(void)gameController:(GameController *)controller mudarParaScene:(GameOverScene *)gameOver {
    
    [controller setGameState:GameStateEnded];
    [gameOver setScaleMode:self.scaleMode];
    [gameOver setGameController:self.gameController];
    
    SKTransition *transition = [SKTransition fadeWithDuration:0.5];
    [self.view presentScene:gameOver transition:transition];
}

@end
