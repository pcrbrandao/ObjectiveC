//
//  PauseScreen.h
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"

@protocol PauseScreenDelegate;

@interface PauseScreen : CCNode

@property (nonatomic,retain) CCNode *background;
@property (nonatomic,retain) CCSprite *title;
@property (nonatomic,retain) CCButton *resumeButton;
@property (nonatomic,retain) CCButton *quitButton;
@property (nonatomic,retain) CCLayoutBox *menu;
@property (nonatomic,assign) id<PauseScreenDelegate>delegate;

-(void)resumeGame:(id)sender;
-(void)quitGame:(id)sender;
+(PauseScreen *)pauseScreen;

@end

@protocol PauseScreenDelegate <NSObject>

-(void)pauseScreenWillResumeGame:(PauseScreen *)pauseScreen;
-(void)pauseScreenWillQuitGame:(PauseScreen *)pauseScreen;

@end
