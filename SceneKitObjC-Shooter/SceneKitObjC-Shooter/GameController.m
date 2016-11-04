//
//  GameController.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameController.h"
#import <GameplayKit/GameplayKit.h>
#import "GeometryComponent.h"

@interface GameController()

@property (nonatomic,assign)NSTimeInterval lastUpdate;
@property (nonatomic,retain)GKComponentSystem *moveComponents;

@end

@implementation GameController

static GameController *sharedController = nil;

-(instancetype)init {
    self = [super init];
    if (self) {
        _scene = [MainScene sceneNamed:@"art.scnassets/MainScene.scn"];
        SCNNode *playerNode = [_scene.rootNode childNodeWithName:@"spherePlayer" recursively:YES];
        _player = [[PlayerEntity alloc] initWithScene:_scene andNode:playerNode];
        
        _moveComponents = [[GKComponentSystem alloc] initWithComponentClass:[MoveComponent class]];
        for (GKComponent *component in [_player components]) {
            if ([component isKindOfClass:[MoveComponent class]]) {
                [_moveComponents addComponent:component];
            }
        }
    }
    return self;
}

+(GameController *)sharedController {
    if (!sharedController) {
        sharedController = [[GameController alloc] init];
    }
    return sharedController;
}

-(void)handleTapGesture:(UITapGestureRecognizer *)tap inView:(SCNView *)view {
    [self.player.moveComponent moveWithTap:tap inView:view];
}

-(void)updateAtTime:(NSTimeInterval)time {
    if (self.lastUpdate == 0) {
        self.lastUpdate = time;
    }
    
    NSTimeInterval delta = time - self.lastUpdate;
    self.lastUpdate = time;
    [self.moveComponents updateWithDeltaTime:delta];
}

-(void)renderer:(id<SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time {
    
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didSimulatePhysicsAtTime:(NSTimeInterval)time {
    [self updateAtTime:time];
    // NSLog(@"updating with time.......%f", time);
}

@end
