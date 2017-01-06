//
//  GameScene.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import <GameplayKit/GameplayKit.h>
#import "Camera.h"

@interface GameScene : SCNScene

@property (nonatomic,retain) Camera *camera;

@end
