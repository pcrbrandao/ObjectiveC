//
//  Shoot.h
//  14Bis
//
//  Created by Pedro Brandão on 18/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WasHit.h"

@protocol ShootDelegate;

@interface Shoot : CCSprite<WasHitProtocol> { }

@property (nonatomic,assign) id<ShootDelegate>delegate;
@property (nonatomic,assign) float positionX;
@property (nonatomic,assign) float positionY;

-(id)initWithPositionX:(float)x andPositionY:(float)y;
-(void)removeMe;

@end

@protocol ShootDelegate <NSObject>

-(void)shootWillBeRemoved:(Shoot *)shoot;

@end