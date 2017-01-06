//
//  GamaScene.h
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MeteorsEngine.h"
#import "Player.h"
#import "Shoot.h"
#import "Meteor.h"
#import "Score.h"
#import "PauseScreen.h"

@interface GameScene : CCNode <MeteorsEngineDelegate,
PlayerDelegate, MeteorDelegate, ShootDelegate, PauseScreenDelegate> { }

@property (retain,nonatomic) CCSprite *background;

@property (retain,nonatomic) MeteorsEngine *meteorsEngine;
@property (retain,nonatomic) NSMutableArray *meteorsArray;
@property (retain,nonatomic) CCNode *meteorsNode;

@property (retain,nonatomic) CCNode *playerNode;
@property (retain,nonatomic) Player *player;
@property (retain,nonatomic) NSMutableArray *playersArray;

@property (retain,nonatomic) CCNode *shootsLayer;
@property (retain,nonatomic) NSMutableArray *shootsArray;

@property (retain,nonatomic) CCNode *gameButtonLayer;
//@property (retain,nonatomic) CCButton *leftButton;
//@property (retain,nonatomic) CCButton *rightButton;
@property (retain,nonatomic) CCButton *shootButton;
@property (retain,nonatomic) CCButton *pauseButton;
@property (retain,nonatomic) CCLayoutBox *menu;

@property (retain,nonatomic) CCNode *scoreLayer;
@property (retain,nonatomic) Score *score;

@property (retain,nonatomic) CCNode *topLayer;
@property (retain,nonatomic) PauseScreen *pauseScreen;

-(void)startGame;
-(void)startEngines;
-(void)startFinalScreen;
-(void)pauseGame:(id)sender;

-(void)moveLeft:(id)sender;
-(void)moveRight:(id)sender;
-(void)shoot:(id)sender;

-(void)checkColisaoEntreArray:(NSArray *)array1 eArray:(NSArray *)array2;
-(void)checkHits:(float)dt;

+ (CCScene *)scene;

@end
