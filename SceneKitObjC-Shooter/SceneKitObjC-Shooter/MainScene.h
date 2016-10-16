//
//  MainScene.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import "PlayerEntity.h"

@interface MainScene : SCNScene

@property (nonatomic,retain)PlayerEntity *player;

@end
