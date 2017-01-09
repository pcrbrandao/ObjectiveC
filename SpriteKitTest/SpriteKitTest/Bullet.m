//
//  Bullet.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Bullet.h"
#import "GameScene.h"
#import "GameType.h"

@implementation Bullet

-(id)initWithSprite:(SKSpriteNode *)sprite Scene:(SKScene *)scene andImageNamed:(NSString *)image {
    
    self = [super initWithImageNamed:image];
    if (self) {
        [self setScale:1];
        [self setPosition:sprite.position];
        [self setZPosition:1];
        [self setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:self.size]];
        [self.physicsBody setAffectedByGravity:NO];
        [self.physicsBody setCategoryBitMask:PhysicsCategoryBullet];
        [self.physicsBody setCollisionBitMask:PhysicsCategoryNone];
        [self.physicsBody setContactTestBitMask:PhysicsCategoryEnemy];
        
        SKAction *moveBullet = [SKAction moveToY:scene.size.height + self.size.height duration:1];
        SKAction *deleteBullet = [SKAction removeFromParent];
        SKAction *bulletSequence = [SKAction sequence:(@[moveBullet, deleteBullet])];
        [self runAction:bulletSequence];
    }
    return self;
}

@end
