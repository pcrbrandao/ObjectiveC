//
//  Player.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Player.h"
#import "GameType.h"
#import "GameScene.h"

@implementation Player

-(id)initWithScene:(SKScene *)scene andImageNamed:(NSString *)image {
    self = [super initWithImageNamed:image];
    if (self) {
        [self setScale:1];
        [self setPosition:CGPointMake(scene.size.width/2, scene.size.height * 0.2)];
        [self setZPosition:2];
        [self setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:self.size]];
        [self.physicsBody setAffectedByGravity:NO];
        [self.physicsBody setCategoryBitMask:PhysicsCategoryPlayer];
        [self.physicsBody setCollisionBitMask:PhysicsCategoryNone];
        [self.physicsBody setContactTestBitMask:PhysicsCategoryEnemy];
    }
    return self;
}

-(id)initWithSCene:(SKScene *)scene {
    self = [self initWithScene:scene andImageNamed:@"playerShip"];
    
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches InScene:(GameScene *)scene {
    
    CGRect area = [scene gameArea];
    
    for (id touch in touches) {
        CGPoint pointOfTouch = [touch locationInNode:self];
        CGPoint previousPointOfTouch = [touch previousLocationInNode:self];
        
        CGFloat amountDragged = pointOfTouch.x - previousPointOfTouch.x;
        CGFloat newX = self.position.x + amountDragged;
        
        if (newX > CGRectGetMaxX(area) - self.size.width/2) {
            newX = CGRectGetMaxX(area) - self.size.width/2;
        }
        
        if (newX < CGRectGetMinX(area) + self.size.width/2) {
            newX = CGRectGetMinX(area) + self.size.width/2;
        }
        
        CGPoint newPosition = CGPointMake(newX, self.position.y);
        self.position = newPosition;
    }
}

@end
