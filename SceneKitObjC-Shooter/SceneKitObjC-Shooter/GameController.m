//
//  GameController.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameController.h"

@implementation GameController

static GameController *sharedController = nil;

-(instancetype)init {
    self = [super init];
    if (self) {
        _scene = [MainScene sceneNamed:@"art.scnassets/MainScene.scn"];
    }
    return self;
}

+(GameController *)sharedController {
    if (!sharedController) {
        sharedController = [[GameController alloc] init];
    }
    return sharedController;
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    
}

@end
