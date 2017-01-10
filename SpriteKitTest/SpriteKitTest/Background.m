//
//  Background.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Background.h"

@implementation Background

-(id)initWithScene:(SKScene *)scene andImageNamed:(NSString *)image {
    self = [super initWithImageNamed:image];
    if (self) {
        [self setSize:scene.size];
        [self setPosition:CGPointMake(scene.size.width/2, scene.size.height/2)];
        [self setZPosition:0];
        [self setName:@"Background"];
        [self setAnchorPoint:CGPointMake(0.5, 0)];
        [self setPosition:CGPointMake(self.size.width/2, 0)];
        
        [self setLastUpdateTime:0];
        [self setDeltaFrameTime:0];
        [self setAmountToMovePerSecond:600.0];
    }
    return self;
}

-(id)initWithScene:(SKScene *)scene {
    self = [self initWithScene:scene andImageNamed:@"background"];
    
    return self;
}

-(void)updateTime:(NSTimeInterval)time {
    if (self.lastUpdateTime == 0) {
        [self setLastUpdateTime:time];
    } else {
        [self setDeltaFrameTime:time - self.lastUpdateTime];
        [self setLastUpdateTime:time];
    }
}

-(void)animateInScene:(SKScene *)scene WithTime:(NSTimeInterval)time {
    
    [self updateTime:time];
    
    [self setAmountToMoveBackground:self.amountToMovePerSecond*(CGFloat)self.deltaFrameTime];
    [scene enumerateChildNodesWithName:@"Background" usingBlock:^(SKNode *node, BOOL *stop) {
        
        [node setPosition:CGPointMake(node.position.x, node.position.y-self.amountToMoveBackground)];
        
        if (node.position.y < -self.size.height) {
            [node setPosition:CGPointMake(node.position.x, node.position.y+self.size.height*2)];
        }
    }];
}

-(void)addBackgroundsInScene:(SKScene *)scene {
    
    for (int i=0; i<=1 ; i++) {
        Background *bkg = [[Background alloc] initWithScene:scene];
        [bkg setPosition:CGPointMake(scene.size.width/2, scene.size.height*i)];
        [scene addChild:bkg];
    }
}

@end
