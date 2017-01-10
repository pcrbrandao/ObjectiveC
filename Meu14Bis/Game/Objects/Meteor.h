//
//  Meteor.h
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WasHit.h"

@protocol MeteorDelegate;

@interface Meteor : CCSprite<WasHitProtocol> { }

@property (nonatomic, assign) float positionX;
@property (nonatomic, assign) float positionY;
@property (nonatomic, retain) NSString *arquivo;
@property (nonatomic, assign) id<MeteorDelegate>delegate;

-(id)initComArquivo:(NSString *)arquivo;

-(void)removeMe;

@end

@protocol MeteorDelegate <NSObject>

-(void)meteorWillBeRemoved:(Meteor *)meteor;

@end