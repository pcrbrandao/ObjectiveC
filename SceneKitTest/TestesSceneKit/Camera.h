//
//  Camera.h
//  TestesSceneKit
//
//  Created by Pedro Brandão on 31/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import "CameraComponent.h"

@interface Camera : GKEntity

@property (nonatomic,retain) CameraComponent *cameraComponent;

@end
