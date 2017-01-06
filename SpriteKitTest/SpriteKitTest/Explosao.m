//
//  Explosao.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 01/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Explosao.h"

@implementation Explosao

-(id)initWithPoint:(CGPoint)point {
    self = [super initWithImageNamed:@"explosion"];
    if (self) {
        [self setPosition:point];
        [self setZPosition:3];
        [self setScale:0];
    }
    return self;
}

-(SKAction *)sequence {
    SKAction *scaleIn = [SKAction scaleTo:1 duration:0.1];
    SKAction *fadeOut = [SKAction fadeOutWithDuration:0.1];
    SKAction *delete = [SKAction removeFromParent];
    _sequence = [SKAction sequence:@[scaleIn,fadeOut,delete]];
    return _sequence;
}

@end
