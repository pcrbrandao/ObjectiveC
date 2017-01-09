//
//  Enemy.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 01/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Enemy.h"
#import "GameType.h"

@implementation Enemy

-(id)initWithScene:(GameScene *)cena {
    self = [super initWithImageNamed:@"enemyShip"];
    if (self) {
        // _cena = cena;
        GKRandomDistribution *random = [GKRandomDistribution distributionWithLowestValue:CGRectGetMinX(cena.gameArea) highestValue:CGRectGetMaxX(cena.gameArea)];
        startPoint = CGPointMake([random nextInt], cena.size.height * 1);
        endPoint = CGPointMake([random nextInt], cena.size.height * 0);
        
        [self setScale:1];
        [self setPosition:startPoint];
        [self setZPosition:2];
        [self setZRotation:[self amountToRotate]];
        [self setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:self.size]];
        [self.physicsBody setAffectedByGravity:NO];
        [self.physicsBody setCategoryBitMask:PhysicsCategoryEnemy];
        [self.physicsBody setCollisionBitMask:PhysicsCategoryNone];
        [self.physicsBody setContactTestBitMask:PhysicsCategoryPlayer | PhysicsCategoryBullet];
    }
    return self;
}

-(SKAction *)sequence {
    SKAction *move = [SKAction moveTo:endPoint duration:1.5];
    SKAction *deleteMe = [SKAction removeFromParent];
    return [SKAction sequence:@[move,deleteMe]];
}

-(CGFloat)amountToRotate {
    CGFloat dx = endPoint.x - startPoint.x;
    CGFloat dy = endPoint.y - startPoint.y;
    return (CGFloat)atan2(dy, dx);
}

+(void)spawnInScene:(GameScene *)cena {
    Enemy *enemy = [[Enemy alloc] initWithScene:cena];
    [enemy setName:@"Enemy"];
    [cena addChild:enemy];
    [enemy runAction:[enemy sequence]];
}

@end
