//
//  FinalScreen.m
//  14Bis
//
//  Created by Pedro Brandão on 25/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FinalScreen.h"
#import "OALSimpleAudio.h"
#import "TitleScreenNode.h"

@implementation FinalScreen

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

-(CCSprite *)background {
    if (!_background) {
        _background = [CCSprite spriteWithImageNamed:kBACKGROUND];
        _background.position = ccp(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    }
    return _background;
}

-(CCSprite *)title {
    if (!_title) {
        _title = [CCSprite spriteWithImageNamed:kFINALEND];
        _title.position = ccp(SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)+125);
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
        [_menu setAnchorPoint:ccp(0.5, 0.5)];
        [_menu setPosition:ccp(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    }
    return _menu;
}

#pragma mark - Métodos

-(void)restartGame:(id)sender {
    [[OALSimpleAudio sharedInstance] bgPaused];
    [[CCDirector sharedDirector] replaceScene:[TitleScreenNode scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

+(CCScene *)scene {
    CCScene *cena = [CCScene node];
    
    FinalScreen *layer = [FinalScreen node];
    [cena addChild:layer];
    
    return cena;
}

@end
