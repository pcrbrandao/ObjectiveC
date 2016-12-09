//
//  MoveComponent.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "MoveComponent.h"
#import "GeometryComponent.h"
#import "MainScene.h"
#import <GLKit/GLKit.h>
#import <Utilidades/Utilidades.h>

@import Utilidades;

@interface MoveComponent()

@property (nonatomic,retain)SCNNode *node;

@end

@implementation MoveComponent

-(instancetype)initWithNode:(SCNNode *)node {
    self = [super init];
    if (self) {
        _node = node;
    }
    return self;
}
/**
 * @brief Move o player com base da posição do tap na tela
 */
-(void)moveWithTap:(UITapGestureRecognizer *)tap inView:(SCNView *)view {
    [self.node.physicsBody applyForce:[self vectorWithTap:tap inView:view] impulse:YES];
}

/**
 * @brief Retorna um vetor unitário na direção em que o player deve ir
 */
-(SCNVector3)vectorWithTap:(UITapGestureRecognizer *)tap inView:(SCNView *)view {
    
    SCNVector3 playerLocation = [self.node.presentationNode position];
    CGPoint tapLocation = [tap locationInView:(UIView *)view];
    SCNHitTestResult *shape = nil;
    SCNVector3 floorPosition;
    SCNVector3 vectorReturn;
    
    NSArray<SCNHitTestResult *> *hitResults = [(SCNView *)view hitTest:tapLocation options:nil];
    
    if (hitResults && hitResults.count > 0) {
        shape = [hitResults firstObject];
        
        if (shape && [shape.node.name isEqualToString:@"planeFloor"]) {
            floorPosition = [shape localCoordinates];
            
            vectorReturn = [Games unityVectorFromVector:playerLocation toPoint:floorPosition];
        }
    }
    return vectorReturn;
}

/**
 * @brief Apenas auxilia no debug
 */
-(void)logPositionInNode:(SCNNode *)node withDescription:(NSString *)description {
    NSLog(@"%@..........: %f, %f", description, node.position.x, node.position.z);
}

/**
 * @warnig Ainda não implementei aqui. Não faz nada ainda
 */
-(void)updateWithDeltaTime:(NSTimeInterval)seconds {
    //[self logPositionInNode:self.node withDescription:@"no moveComponent"];
}

@end
