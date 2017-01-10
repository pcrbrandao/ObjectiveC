//
//  StartScene.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 07/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "StartScene.h"
#import "GameScene.h"

@implementation StartScene

#pragma mark Propriedades

-(Background *)background {
    if (!_background) {
        _background = [[Background alloc] initWithScene:self];
    }
    return _background;
}

-(GameLabel *)startLabel {
    if (!_startLabel) {
        _startLabel = [[GameLabel alloc] initWithTexto:@"Iniciar Jogo" alinhadoA:SKLabelHorizontalAlignmentModeCenter];
        [_startLabel setFontSize:150];
        [_startLabel setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
    }
    return _startLabel;
}

-(GameController *)gameController {
    if (!_gameController) {
        _gameController = [GameController sharedController];
    }
    return _gameController;
}

#pragma mark Sobrepostos

-(void)didMoveToView:(SKView *)view {
    
    [self.gameController setGameState:GameStatePreGame];
    [self.background addBackgroundsInScene:self];
    [self addChild:self.startLabel];
}

-(void)update:(NSTimeInterval)currentTime {
    
    [self.background animateInScene:self WithTime:currentTime];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint pointOfTouch = [touch locationInNode:self];
        if ([self.startLabel containsPoint:pointOfTouch]) {
            [self gameController:self.gameController mudarParaScene:[GameScene sceneWithSize:self.size]];
        }
    }
}

-(void)gameController:(GameController *)controller mudarParaScene:(GameScene *)scene {
    [controller setGameState:GameStateRunning];
    [controller setGameScore:0];
    [controller setLivesNumber:3];
    [controller setGameState:GameStateRunning];
    
    SKTransition *transition = [SKTransition fadeWithDuration:0.5];
    
    [scene setScaleMode:self.scaleMode];
    [scene setGameController:controller];
    
    [self.view presentScene:scene transition:transition];
}

@end
