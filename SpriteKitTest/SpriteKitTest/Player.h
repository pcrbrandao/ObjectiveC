//
//  Player.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class GameScene;

@interface Player : SKSpriteNode

-(id)initWithScene:(SKScene *)scene andImageNamed:(NSString *)image;
-(id)initWithSCene:(SKScene *)scene;

-(void)touchesMoved:(NSSet<UITouch *> *)touches InScene:(GameScene *)scene;

@end
