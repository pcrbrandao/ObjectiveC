//
//  TitleScreenNode.m
//  14Bis
//
//  Created by Pedro Brandão on 12/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "TitleScreenNode.h"
#import "GameScene.h"

@implementation TitleScreenNode

- (id)init {
    self = [super init];
    if (self) {
        // Tela de fundo
        [self addChild:self.background];
        
        // Imagem de Logo
        [self addChild:self.title];
        
        // Menu
        [self addChild:self.menu];
    }
    return self;
}

#pragma mark Atributos

-(CCSprite *)background {
    if (!_background) {
        _background = [CCSprite spriteWithImageNamed:kBACKGROUND];
        _background.position = ccp(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    }
    return _background;
}

-(CCSprite *)title {
    if (!_title ) {
        _title = [CCSprite spriteWithImageNamed:kLOGO];
        _title.position = ccp(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 125);
    }
    return _title;
}

-(CCLayoutBox *)menu {
    if (!_menu) {
        _playButton = self.playButton;
        _menu = [[CCLayoutBox alloc] init];
        [_menu addChild:self.playButton];
        [_menu addChild:self.highscoreButton];
        [_menu addChild:self.helpButton];
        [_menu addChild:self.soundButton];
        
        [_menu setDirection:CCLayoutBoxDirectionVertical];
        [_menu setSpacing:10];
        [_menu setAnchorPoint:ccp(-0.5, -0.5)];
        [_menu layout];
    }
    return _menu;
}

-(CCButton *)playButton {
    if (!_playButton) {
        _playButton = [self configButton:_playButton comImagem:kPLAY origem:ccp(0, 0)
                  selector:@selector(playGame:)];
    }
    return _playButton;
}

-(CCButton *)highscoreButton {
    if (!_highscoreButton) {
        _highscoreButton = [self configButton:_highscoreButton comImagem:kHIGHSCORE
                    origem:ccp(0,-50) selector:@selector(viewHighscore:)];
    }
    return _highscoreButton;
}

-(CCButton *)helpButton {
    if (!_helpButton) {
        _helpButton = [self configButton:_helpButton comImagem:kHELP origem:ccp(0,-100)
                  selector:@selector(viewHelp:)];
    }
    return _helpButton;
}

-(CCButton *)soundButton {
    if (!_soundButton) {
        CGPoint origem = ccp((SCREEN_WIDTH / -2) + 70, (SCREEN_HEIGHT / 2) + 70);
        _soundButton = [self configButton:_soundButton comImagem:kSOUND
                    origem:origem selector:@selector(toggleSound:)];
    }
    return _soundButton;
}

#pragma mark Métodos

+ (CCScene *)scene {
    
    CCScene *scene = [CCScene node];
    TitleScreenNode *layer = [TitleScreenNode node];
    
    [scene addChild:layer];
    
    return scene;
}

-(CCButton *)configButton:(CCButton *)button comImagem:(NSString *)nome origem:(CGPoint)origem selector:(SEL)selecionador {
    if (!button) {
        UIImage *imagem = [UIImage imageNamed:nome];
        CGSize size = [imagem size];
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        CCSpriteFrame *frame = [[CCSpriteFrame alloc] initWithTextureFilename:nome
                                                                 rectInPixels:rect
                                                                      rotated:NO
                                                                       offset:ccp(0,0)
                                                                 originalSize:size];
        button = [[CCButton alloc] initWithTitle:@"" spriteFrame:frame];
        [button setTarget:self selector:selecionador];
        [button setPosition:origem];
    }
    return button;
}

-(void)playGame:(id)sender {
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:1.0]];
}

-(void)viewHighscore:(id)sender {
}

-(void)viewHelp:(id)sender {
}

-(void)toggleSound:(id)sender {
}

@end
