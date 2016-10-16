//
//  PlayerEntity.h
//  RogueLikeObjC
//
//  Created by Pedro Brandão on 01/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameplayKit/GameplayKit.h>
#import "AnimationComponent.h"

@interface PlayerEntity : GKEntity

@property (nonatomic,readonly)AnimationComponent *animationComponent;

@end
