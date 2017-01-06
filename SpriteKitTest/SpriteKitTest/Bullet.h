//
//  Bullet.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bullet : SKSpriteNode

//@property (nonatomic,strong) SKAction *bulletSound;

-(id)initWithSprite:(SKSpriteNode *)sprite Scene:(SKScene *)scene andImageNamed:(NSString *)image;

@end
