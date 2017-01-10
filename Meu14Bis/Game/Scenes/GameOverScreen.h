//
//  GameOverScreen.h
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "TitleScreenNode.h"

@interface GameOverScreen : CCNode

@property (nonatomic,retain) CCSprite *background;
@property (nonatomic,retain) CCSprite *title;
@property (nonatomic,retain) CCButton *beginButton;
@property (nonatomic,retain) CCLayoutBox *menu;

+(CCScene *)scene;
-(void)restartGame:(id)sender;

@end
