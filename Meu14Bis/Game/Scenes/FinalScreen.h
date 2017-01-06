//
//  FinalScreen.h
//  14Bis
//
//  Created by Pedro Brandão on 25/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface FinalScreen : CCNode

@property (nonatomic,retain)CCSprite *background;
@property (nonatomic,retain)CCSprite *title;

@property (nonatomic,retain)CCButton *beginButton;
@property (nonatomic,retain)CCLayoutBox *menu;

-(void)restartGame:(id)sender;

+(CCScene *)scene;

@end
