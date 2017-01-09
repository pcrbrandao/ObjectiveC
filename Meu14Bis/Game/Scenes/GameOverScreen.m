//
//  GameOverScreen.m
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "GameOverScreen.h"
#import "OALSimpleAudio.h"

@implementation GameOverScreen

-(id)init {
    self = [super init];
    if (self) {
        [[OALSimpleAudio sharedInstance] playEffect:@"finalend.wav"];
        [self addChild:self.background];
        [self addChild:self.title];
        [self addChild:self.menu];
    }
    return self;
}

+(CCScene *)scene {
    
    CCScene *scene = [CCScene node];
    GameOverScreen *layer = [GameOverScreen node];
    
    [scene addChild:layer];
    
    return scene;
}

-(CCSprite *)background {
    if (!_background) {
        _background = [CCSprite spriteWithImageNamed:kBACKGROUND];
        _background.position = ccp(SCREEN_WIDTH/2,SCREEN_HEIGHT/2);
    }
    return _background;
}

-(CCSprite *)title {
    if (!_title) {
        _title = [CCSprite spriteWithImageNamed:kGAMEOVER];
        [_title setPosition:ccp(SCREEN_WIDTH/2, (SCREEN_WIDTH/2)+125)];
    }
    return _title;
}

-(CCButton *)beginButton {
    if (!_beginButton) {
        _beginButton = [CCButton buttonWithTitle:@""
                                     spriteFrame:[CCSpriteFrame frameWithImageNamed:kPLAY]];
        [_beginButton setTarget:self selector:@selector(restartGame:)];
    }
    return _beginButton;
}

-(CCLayoutBox *)menu {
    if (!_menu) {
        _menu = [[CCLayoutBox alloc] init];
        [_menu addChild:self.beginButton];
        [_menu setPosition:ccp(SCREEN_WIDTH/2, SCREEN_WIDTH/2)];
        [_menu setAnchorPoint:ccp(0.5, 0.5)];
    }
    return _menu;
}

-(void)restartGame:(id)sender {
    [[OALSimpleAudio sharedInstance] setBgPaused:YES];
    [[CCDirector sharedDirector] replaceScene:[TitleScreenNode scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

@end
