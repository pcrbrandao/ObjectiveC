//
//  TitleScreenNode.h
//  14Bis
//
//  Created by Pedro Brandão on 12/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TitleScreenNode : CCNode {
    
}

@property (nonatomic, retain) CCSprite *background;
@property (nonatomic, retain) CCSprite *title;
@property (nonatomic, retain) CCLayoutBox *menu;

@property (nonatomic, retain) CCButton *playButton;
@property (nonatomic, retain) CCButton *highscoreButton;
@property (nonatomic, retain) CCButton *helpButton;
@property (nonatomic, retain) CCButton *soundButton;

-(void)playGame:(id)sender;
-(void)viewHighscore:(id)sender;
-(void)viewHelp:(id)sender;
-(void)toggleSound:(id)sender;

-(CCButton *)configButton:(CCButton *)button comImagem:(NSString *)nome origem:(CGPoint)origem selector:(SEL)selecionador;

+(CCScene *)scene;

@end
