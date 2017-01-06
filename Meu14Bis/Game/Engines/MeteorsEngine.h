//
//  MeteorsEngine.h
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Meteor.h"

@protocol MeteorsEngineDelegate;

@interface MeteorsEngine : CCNode { }

@property (nonatomic, assign)id<MeteorsEngineDelegate>delegate;

+(MeteorsEngine *)meteorEngine;

@end

@protocol MeteorsEngineDelegate <NSObject>

-(void)meteorsEngineDidCreateMeteor:(Meteor *)meteor;

@end