//
//  Player.h
//  14Bis
//
//  Created by Pedro Brandão on 17/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Shoot.h"
#import "WasHit.h"
#import "Acelerometro.h"

@protocol PlayerDelegate <NSObject>

-(void)playerDidCreateShoot:(Shoot *)shoot;

@end

@interface Player : CCSprite<WasHitProtocol> { }

@property (nonatomic, assign) id<PlayerDelegate>delegate;

@property (nonatomic, assign) float positionX;
@property (nonatomic, assign) float positionY;
@property (nonatomic, retain) NSString *arquivo;

-(id)initComArquivo:(NSString *)arquivo;
-(id)initKnave;
-(void)shoot;
-(void)moveLeft;
-(void)moveRight;

-(void)monitorAcelerometro;

@end
