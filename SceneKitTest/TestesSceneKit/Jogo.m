//
//  Jogo.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 16/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Jogo.h"
#import "ShapeTypes.h"
#import "ShapeEntity.h"

@implementation Jogo

#pragma mark Propriedades

-(GameHelper *)gameHUD {
    if (!_gameHUD) {
        _gameHUD = [GameHelper sharedInstance];
        _gameHUD.hudNode.position = SCNVector3Make(0, 10, 0);
    }
    return _gameHUD;
}

-(SCNScene *)scene {
    if (!_scene) {
        _scene = [GameScene scene];
        [_scene.rootNode addChildNode:self.gameHUD.hudNode];
    }
    return _scene;
}

#pragma mark Métodos

-(void)spawnShape {
    
    ShapeEntity *shapeEntity = [[ShapeEntity alloc] initWithShape:[ShapeTypes random]];
    
    [self.entities addObject:shapeEntity];
    [self.scene.rootNode addChildNode:[shapeEntity geometryNode]];
}

-(void)cleanScene {
    
    for (ShapeEntity *entity in self.entities) {
        if (entity.geometryNode.presentationNode.position.y < -2 ) {
            [entity.geometryNode removeFromParentNode];
            [self.entities removeObject:entity];
        }
    }
}

-(void)handleTouches:(NSSet<UITouch *> *)touches inView:(SCNView *)scnView {
    
    if ([[touches allObjects] firstObject]) {
        
        UITouch *touch = [[touches allObjects] firstObject];
        CGPoint location = [touch locationInView:scnView];
        
        NSArray *hitResults = [scnView hitTest:location options:nil];
        
        if (hitResults) {
            if ([hitResults count] > 0) {
                
                SCNHitTestResult *shapeEntity = [hitResults firstObject];
                if ([shapeEntity.node.name  isEqualToString: @"GOOD"]) {
                    self.gameHUD.score += 1;
                } else if ([shapeEntity.node.name isEqualToString: @"BAD"]) {
                    
                    self.gameHUD.lives -= 1;
                }
                [shapeEntity.node removeFromParentNode];
            }
        }
    }
}

#pragma mark Sobrepostos

-(id)init {
    self = [super init];
    if (self) {
        _spawnTime = 0;
    }
    return self;
}

-(void)renderer:(id<SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time {
    
    if (time > self.spawnTime) {
        [self spawnShape];
        
        NSTimeInterval intervalo = (NSTimeInterval)[[GKRandomDistribution distributionWithLowestValue:2 highestValue:15] nextInt]/10.0;
        
        [self setSpawnTime:time + intervalo];
        [self.gameHUD updateHUD];
        [self cleanScene];
    }
}

@end
