//
//  GameScene.m
//  RogueLikeObjC
//
//  Created by Pedro Brandão on 01/09/16.
//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(PlayerEntity *)player {
    if (!_player) {
        _player = [[PlayerEntity alloc] init];
    }
    return _player;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
     */
    [self.player.animationComponent.node setPosition:CGPointMake(0.0, 0.0)];
    [self addChild:self.player.animationComponent.node];
    [self.player.animationComponent playIdleMovement];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        NSLog(@"Posicao %f, %f", location.x, location.y);
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
     */
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
