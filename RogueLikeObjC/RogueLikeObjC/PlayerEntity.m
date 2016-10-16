//
//  PlayerEntity.m
//  RogueLikeObjC
//
//  Created by Pedro Brandão on 01/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "PlayerEntity.h"

@implementation PlayerEntity


-(id)init {
    self = [super init];
    if (self) {
        _animationComponent = [[AnimationComponent alloc] initWithAtlasName:@"PlayerIdle"];
        [self addComponent:_animationComponent];
    }
    
    return self;
}

@end
