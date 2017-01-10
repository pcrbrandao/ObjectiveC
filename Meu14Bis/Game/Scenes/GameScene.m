//
//  GamaScene.m
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "GameScene.h"
#import "OALSimpleAudio.h"
#import "FinalScreen.h"
#import "GameOverScreen.h"

@implementation GameScene

-(id)init {
    self = [super init];
    if (self) {
        [self addChild:self.background];
        [self addChild:self.meteorsNode];
        [self addChild:self.playerNode];
        [self addChild:self.gameButtonLayer];
        [self addChild:self.shootsLayer];
        [self addChild:self.scoreLayer];
        [self addChild:self.topLayer];
        
        [self preLoadCacheComArray:@[@"shoot.wav",@"bang.wav",@"over.wav"]];
        [[OALSimpleAudio sharedInstance] playBg:@"music.wav" loop:YES];
    }
    return self;
}

#pragma mark Layers

-(CCNode *)topLayer {
    if (!_topLayer) {
        _topLayer = [CCNode node];
    }
    return _topLayer;
}

-(CCNode *)scoreLayer {
    if (!_scoreLayer) {
        _scoreLayer = [CCNode node];
        [_scoreLayer addChild:self.score];
    }
    return _scoreLayer;
}

-(CCNode *)shootsLayer {
    if (!_shootsLayer) {
        _shootsLayer = [CCNode node];
    }
    return _shootsLayer;
}

-(CCNode *)playerNode {
    if (!_playerNode) {
        _playerNode = [CCNode node];
        [_playerNode addChild:self.player];
    }
    return _playerNode;
}

-(CCNode *)meteorsNode {
    if (!_meteorsNode) {
        _meteorsNode = [CCNode node];
    }
    return _meteorsNode;
}

-(CCNode *)gameButtonLayer {
    if (!_gameButtonLayer) {
        _gameButtonLayer = [CCNode node];
        [_gameButtonLayer addChild:self.menu];
    }
    
    return _gameButtonLayer;
}

#pragma mark Objetos

-(Score *)score {
    if (!_score) {
        _score = [[Score alloc] init];
    }
    return _score;
}

-(CCLayoutBox *)menu {
    if (!_menu) {
        _menu = [[CCLayoutBox alloc] init];
        // CCLayoutBox *direcaoBox = [[CCLayoutBox alloc] init];
        // [direcaoBox addChild:self.leftButton];
        // [direcaoBox addChild:self.rightButton];
        // [_menu addChild:direcaoBox];
        [_menu addChild:self.pauseButton];
        [_menu addChild:self.shootButton];
        [_menu setSpacing:SCREEN_WIDTH/2-50];
        [_menu setAnchorPoint:ccp(1,0)];
        [_menu setPosition:ccp(SCREEN_WIDTH,0)];
    }
    return _menu;
}

/*
-(CCButton *)leftButton {
    if (!_leftButton) {
        CCSpriteFrame *frame = [CCSpriteFrame frameWithImageNamed:kLEFTCONTROL];
        _leftButton = [CCButton buttonWithTitle:@"" spriteFrame:frame];
        [_leftButton setTarget:self selector:@selector(moveLeft:)];
    }
    return _leftButton;
}

-(CCButton *)rightButton {
    if (!_rightButton) {
        CCSpriteFrame *frame = [CCSpriteFrame frameWithImageNamed:kRIGHTCONTROL];
        _rightButton = [CCButton buttonWithTitle:@"" spriteFrame:frame];
        [_rightButton setTarget:self selector:@selector(moveRight:)];
    }
    return _rightButton;
}
 */
-(CCButton *)pauseButton {
    if (!_pauseButton) {
        _pauseButton = [CCButton buttonWithTitle:@""
                                     spriteFrame:[CCSpriteFrame frameWithImageNamed:kPAUSE]];
        [_pauseButton setTarget:self selector:@selector(pauseGame:)];
    }
    return _pauseButton;
}

-(CCButton *)shootButton {
    if (!_shootButton) {
        CCSpriteFrame *frame = [CCSpriteFrame frameWithImageNamed:kSHOOTBUTTON];
        _shootButton = [CCButton buttonWithTitle:@"" spriteFrame:frame];
        [_shootButton setTarget:self selector:@selector(shoot:)];
    }
    return _shootButton;
}

-(CCSprite *)background {
    if (!_background) {
        _background = [CCSprite spriteWithImageNamed:kBACKGROUND];
        _background.position = ccp(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    }
    
    return _background;
}

#pragma mark Controles

-(NSMutableArray *)shootsArray {
    if (!_shootsArray) {
        _shootsArray = [NSMutableArray array];
    }
    return _shootsArray;
}

-(Player *)player {
    if (!_player) {
        _player = [[Player alloc] initKnave];
        _player.delegate = self;
    }
    return _player;
}

-(NSMutableArray *)playersArray {
    if (!_playersArray) {
        _playersArray = [NSMutableArray array];
        [_playersArray addObject:self.player];
    }
    return _playersArray;
}

-(NSMutableArray *)meteorsArray {
    if (!_meteorsArray) {
        _meteorsArray = [NSMutableArray array];
    }
    return _meteorsArray;
}

-(MeteorsEngine *)meteorsEngine {
    if (!_meteorsEngine) {
        _meteorsEngine = [MeteorsEngine meteorEngine];
    }
    return _meteorsEngine;
}

#pragma mark Métodos

-(void)pauseGame:(id)sender {
    NSLog(@"Pausa...");
    if (![[Runner sharedRunner] isGamePaused]) {
        [[Runner sharedRunner] setGamePaused:YES];
    }
    
    if ([[Runner sharedRunner] isGamePaused] && ![self pauseScreen]) {
        [self setPauseScreen:[PauseScreen pauseScreen]];
        [[self pauseScreen] setDelegate:self];
        [[self topLayer] addChild:self.pauseScreen];
    }
}

-(void)preLoadCacheComArray:(NSArray *)arquivos {
    
    for(NSString *arquivo in arquivos) {
        [[OALSimpleAudio sharedInstance] preloadEffect:arquivo];
    }
}

-(void)moveLeft:(id)sender {
    [self.player moveLeft];
}

-(void)moveRight:(id)sender {
    [self.player moveRight];
}

-(void)shoot:(id)sender {
    [self.player shoot];
}

+(CCScene *)scene {
    CCScene *cena = [CCScene node];
    
    GameScene *layer = [GameScene node];
    [cena addChild:layer];
    
    return cena;
}

-(void)onEnter {
    [super onEnter];
    [self startGame];
}

-(void)startGame {
    [self schedule:@selector(checkHits:) interval:(1.0/10.0)];
    [self startEngines];
    [self.player monitorAcelerometro];
    [[Runner sharedRunner] setGamePaused:NO];
}

-(void)startEngines {
    [self addChild:self.meteorsEngine];
    self.meteorsEngine.delegate = self;
}

-(void)startFinalScreen {
    [[CCDirector sharedDirector] replaceScene:[FinalScreen scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

-(void)checkColisaoEntreArray:(NSArray *)array1 eArray:(NSArray *)array2 {
    if (array1.count > 0 && array2.count > 0) {
        for (int i=0; i<[array1 count]; i++) {
            CCSprite<WasHitProtocol> *obj1 = [array1 objectAtIndex:i];
            CGRect rect1 = obj1.boundingBox;
                
            for(int j=0; j<[array2 count]; j++) {
                CCSprite<WasHitProtocol> *obj2 = [array2 objectAtIndex:j];
                CGRect rect2 = obj2.boundingBox;
                
                if (CGRectIntersectsRect(rect1, rect2)) {
                    NSLog(@"Colisão detectada: %@", [obj1 class]);
                    [obj1 explode:self];
                    [obj2 explode:self];
                        
                    i=(int)[array1 count]+1;
                    j=(int)[array2 count]+1;
                }
            }
        }
    }
}

-(void)checkHits:(float)dt {
    
    [self checkColisaoEntreArray:self.meteorsArray eArray:self.shootsArray];
    [self checkColisaoEntreArray:self.playersArray eArray:self.meteorsArray];
}

#pragma mark Delegated
// Delegated
-(void)meteorsEngineDidCreateMeteor:(Meteor *)meteor {
    // incluir meteoro na tela
    [self.meteorsNode addChild:meteor];
    [meteor setDelegate:self];
    [self.meteorsArray addObject:meteor];
}

-(void)playerDidCreateShoot:(Shoot *)shoot {
    [self.shootsLayer addChild:shoot];
    [shoot setDelegate:self];
    [self.shootsArray addObject:shoot];
}

-(void)meteorWillBeRemoved:(Meteor *)meteor {
    [meteor setDelegate:nil];
    [self.meteorsArray removeObject:meteor];
}

-(void)shootWillBeRemoved:(Shoot *)shoot {
    [shoot setDelegate:nil];
    [self.shootsArray removeObject:shoot];
}

-(void)pauseScreenWillQuitGame:(PauseScreen *)pauseScreen {
    [[OALSimpleAudio sharedInstance] setEffectsPaused:YES];
    [[OALSimpleAudio sharedInstance] setBgPaused:YES];
    
    [[CCDirector sharedDirector] replaceScene:[TitleScreenNode scene] withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

-(void)pauseScreenWillResumeGame:(PauseScreen *)pauseScreen {
    if ([[Runner sharedRunner] isGamePaused]) {
        [[self pauseScreen] setDelegate:nil];
        [self setPauseScreen:nil];
        [[Runner sharedRunner] setGamePaused:NO];
    }
}

@end
