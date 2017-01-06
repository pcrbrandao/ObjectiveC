//
//  Player.m
//  14Bis
//
//  Created by Pedro Brandão on 17/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Player.h"
#import "OALSimpleAudio.h"
#import "GameScene.h"
#import "GameOverScreen.h"

#define kNOISE 0.15

@implementation Player

-(id)initKnave {
    return [self initComArquivo:kNAVE];
}

-(id)initComArquivo:(NSString *)arquivo {
    self = [super initWithImageNamed:arquivo];
    if (self) {
        _positionX = SCREEN_WIDTH/2;
        _positionY = 120;
        _position = ccp(_positionX, _positionY);
        _arquivo = arquivo;
    }
    return self;
}

-(void)shoot {
    if (![[Runner sharedRunner] isGamePaused]) {
        if ([self.delegate respondsToSelector:@selector(playerDidCreateShoot:)]) {
            [self.delegate playerDidCreateShoot:[[Shoot alloc]
                                                 initWithPositionX:self.positionX
                                                 andPositionY:self.positionY]];
        }
    }
}

-(void)moveLeft {
    if (![[Runner sharedRunner] isGamePaused]) {
        if (self.positionX > 30) {
            self.positionX -= 10;
        }
        self.position = ccp(self.positionX, self.positionY);
    }
}

-(void)moveRight {
    if (![[Runner sharedRunner] isGamePaused]) {
        if (self.positionX < SCREEN_WIDTH - 30) {
            self.positionX += 10;
        }
        self.position = ccp(self.positionX, self.positionY);
    }
}

-(void)explode:(GameScene *)sender {
    // som
    [[OALSimpleAudio sharedInstance] playEffect:@"over.wav"];
    [[OALSimpleAudio sharedInstance] bgPaused];
    
    // efeitos
    float dt = 0.2;
    CCActionScaleBy *a1 = [CCActionScaleBy actionWithDuration:dt scale:2];
    CCActionFadeOut *a2 = [CCActionFadeOut actionWithDuration:dt];
    CCActionSpawn *s1 = [CCActionSpawn actionWithArray:[NSArray arrayWithObjects:a1,a2, nil]];
    
    // executa
    [self runAction:s1];
    [[sender playersArray] removeObject:self];
    [[CCDirector sharedDirector] replaceScene:[GameOverScreen scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

-(void)monitorAcelerometro {
    [[Acelerometro sharedAcelerometro] startAcelerometroUpdates];
    [[self scheduler] update:0.01];
}

-(void)update:(CCTime)delta {
    if (![[Runner sharedRunner] isGamePaused]) {
        if ([[Acelerometro sharedAcelerometro] currentAccelerationX] < -kNOISE) {
            self.positionX--;
        }
        if ([[Acelerometro sharedAcelerometro] currentAccelerationX] > kNOISE) {
            self.positionX++;
        }
        if ([[Acelerometro sharedAcelerometro] currentAccelarationY] < -kNOISE) {
            self.positionY--;
        }
        if ([[Acelerometro sharedAcelerometro] currentAccelarationY] > kNOISE) {
            self.positionY++;
        }
        
        // check posição na tela
        if (self.positionX < 30.0) {
            self.positionX = 30;
        }
        if (self.positionX > SCREEN_WIDTH - 30) {
            self.positionX = SCREEN_WIDTH - 30;
        }
        if (self.positionY < 30.0) {
            self.positionY = 30.0;
        }
        if (self.positionY > SCREEN_HEIGHT - 30) {
            self.positionY = SCREEN_HEIGHT - 30;
        }
        
        // posicao
        self.position = ccp(self.positionX, self.positionY);
    }
}

@end
