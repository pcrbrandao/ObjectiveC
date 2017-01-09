//
//  Enemy.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 01/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "GameScene.h"

@interface Enemy : SKSpriteNode {
    CGPoint startPoint;
    CGPoint endPoint;
}

-(id)initWithScene:(GameScene *)cena;
+(void)spawnInScene:(GameScene *)cena;

@end
