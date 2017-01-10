//
//  PauseScreen.m
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "PauseScreen.h"

@implementation PauseScreen

-(id)init {
    self = [super init];
    if (self) {
        [self addChild:self.background];
        [self addChild:self.title];
        [self addChild:self.menu];
    }
    return self;
}

-(CCNode *)background {
    if (!_background) {
        _background = [CCNode node];
        [_background setColor:[CCColor colorWithRed:0 green:0 blue:0 alpha:175]];
    }
    return _background;
}

-(CCSprite *)title {
    if (!_title) {
        _title = [CCSprite spriteWithImageNamed:kLOGO];
        [_title setPosition:ccp(SCREEN_WIDTH/2,SCREEN_HEIGHT/2+125)];
    }
    return _title;
}

-(CCButton *)resumeButton {
    if (!_resumeButton) {
        _resumeButton = [CCButton buttonWithTitle:@""
                                      spriteFrame:[CCSpriteFrame frameWithImageNamed:kPLAY]];
        [_resumeButton setTarget:self selector:@selector(resumeGame:)];
    }
    return _resumeButton;
}

-(CCButton *)quitButton {
    if (!_quitButton) {
        _quitButton = [CCButton buttonWithTitle:@""
                                    spriteFrame:[CCSpriteFrame frameWithImageNamed:kEXIT]];
        [_quitButton setTarget:self selector:@selector(quitGame:)];
    }
    return _quitButton;
}

-(CCLayoutBox *)menu {
    if (!_menu) {
        _menu = [[CCLayoutBox alloc] init];
        [_menu addChild:self.resumeButton];
        [_menu addChild:self.quitButton];
        [_menu setDirection:CCLayoutBoxDirectionVertical];
        [_menu setAnchorPoint:ccp(0.5, 1.0)];
        [_menu setPosition:ccp(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    }
    return _menu;
}

+(PauseScreen *)pauseScreen {
    
    return [[PauseScreen alloc] init];
}

-(void)quitGame:(id)sender {
    if ([self.delegate respondsToSelector:@selector(pauseScreenWillQuitGame:)]) {
        [self.delegate pauseScreenWillQuitGame:self];
    }
}

-(void)resumeGame:(id)sender {
    if ([self.delegate respondsToSelector:@selector(pauseScreenWillResumeGame:)]) {
        [self.delegate pauseScreenWillResumeGame:self];
        [self removeFromParentAndCleanup:YES];
    }
}

@end
