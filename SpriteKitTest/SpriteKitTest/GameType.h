//
//  GameType.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 05/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameType : NSObject

typedef NS_OPTIONS(NSUInteger, PhysicsCategory) {
    PhysicsCategoryNone = 0,
    PhysicsCategoryPlayer = 0b1,
    PhysicsCategoryBullet = 0b10,
    PhysicsCategoryEnemy = 0b100
};

typedef NS_OPTIONS(NSInteger, GameState) {
    GameStatePreGame,
    GameStateRunning,
    GameStateEnded
};

@end
