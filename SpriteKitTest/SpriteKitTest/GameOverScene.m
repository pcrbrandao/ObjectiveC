//
//  GameOverScene.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 05/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameOverScene.h"
#import "GameScene.h"

@implementation GameOverScene

#pragma mark Propriedades

-(Background *)background {
    if (!_background) {
        _background = [[Background alloc] initWithScene:self];
    }
    return _background;
}

-(GameLabel *)gameOverLabel {
    if (!_gameOverLabel) {
        _gameOverLabel = [[GameLabel alloc] initWithTexto:@"Game Over" alinhadoA:SKLabelHorizontalAlignmentModeCenter];
        [_gameOverLabel setFontSize:200];
        [_gameOverLabel setPosition:CGPointMake(self.size.width*0.5, self.size.height*0.7)];
    }
    return _gameOverLabel;
}

-(GameLabel *)scoreLabel {
    if (!_scoreLabel) {
        NSString *scoreString = [NSString stringWithFormat:@"Score: %d", self.gameController.gameScore];
        _scoreLabel = [[GameLabel alloc] initWithTexto:scoreString alinhadoA:SKLabelHorizontalAlignmentModeCenter];
        [_scoreLabel setPosition:CGPointMake(self.size.width*0.5, self.size.height*0.55)];
        [_scoreLabel setFontSize:125];
    }
    return _scoreLabel;
}

-(GameLabel *)highScoreLabel {
    if (!_highScoreLabel) {
        NSString *highScoreString = [NSString stringWithFormat:@"High Score: %d", self.gameController.highScore];
        _highScoreLabel = [[GameLabel alloc] initWithTexto:highScoreString alinhadoA:SKLabelHorizontalAlignmentModeCenter];
        [_highScoreLabel setFontSize:125];
        [_highScoreLabel setPosition:CGPointMake(self.size.width/2, self.size.height*0.45)];
    }
    
    return _highScoreLabel;
}

-(GameLabel *)restartLabel {
    if (!_restartLabel) {
        _restartLabel = [[GameLabel alloc] initWithTexto:@"Restart" alinhadoA:SKLabelHorizontalAlignmentModeCenter];
        [_restartLabel setPosition:CGPointMake(self.size.width/2, self.size.height*0.3)];
        [_restartLabel setFontSize:90];
    }
    return _restartLabel;
}

#pragma mark Sobrescritos

-(void)didMoveToView:(SKView *)view {
    
    [self.background addBackgroundsInScene:self];
    [self addChild:self.gameOverLabel];
    [self addChild:self.scoreLabel];
    [self addChild:self.highScoreLabel];
    [self addChild:self.restartLabel];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint pointOfTouch = [touch locationInNode:self];
        if ([self.restartLabel containsPoint:pointOfTouch]) {
            [self gameController:self.gameController mudarParaScene:[GameScene sceneWithSize:self.size]];
        }
    }
}

-(void)update:(NSTimeInterval)currentTime {
    [self.background animateInScene:self WithTime:currentTime];
}

-(void)gameController:(GameController *)controller mudarParaScene:(SKScene *)gameScene {
    [controller setGameState:GameStateRunning];
    [controller setGameScore:0];
    [controller setLivesNumber:3];
    
    SKTransition *transition = [SKTransition fadeWithDuration:0.5];
    
    [gameScene setScaleMode:self.scaleMode];
    [self.view presentScene:gameScene transition:transition];
}

@end
