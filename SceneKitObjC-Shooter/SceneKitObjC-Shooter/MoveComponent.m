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

-(void)moveWithTap:(UITapGestureRecognizer *)tap inView:(SCNView *)view {
    [self.node.physicsBody applyForce:[self vectorWithTap:tap inView:view] impulse:YES];
}

-(SCNVector3)vectorWithTap:(UITapGestureRecognizer *)tap inView:(SCNView *)view {
    
    SCNVector3 playerLocation = [self.node.presentationNode position];
    CGPoint tapLocation = [tap locationInView:(UIView *)view];
    SCNHitTestResult *shape = nil;
    SCNVector3 floorPosition;
    SCNVector3 vectorReturn;
    // CGFloat forca = 1;
    
    NSArray<SCNHitTestResult *> *hitResults = [(SCNView *)view hitTest:tapLocation options:nil];
    
    if (hitResults && hitResults.count > 0) {
        shape = [hitResults firstObject];
        
        if (shape && [shape.node.name isEqualToString:@"planeFloor"]) {
            floorPosition = [shape localCoordinates];
            
            /*
            CGFloat playerZ = playerLocation.z;
            CGFloat floorY = (floorPosition.y * -1);
            CGFloat distY = floorY - playerZ;
            
            CGFloat angle = atan2f(distY, floorPosition.x - playerLocation.x);
            
            NSLog(@"---*****----*****----");
            CGFloat vectorZ = sinf(angle);
            CGFloat vectorX = cos(angle);
            vectorReturn = SCNVector3Make(vectorX, 0.0, vectorZ);
            NSLog(@"Angulo, seno e cosseno...: %f, %f, %f, %f", angle, GLKMathRadiansToDegrees(angle), vectorZ, vectorX);
             */
            // Games *games = [[Games alloc] init];
            vectorReturn = [Games unityVectorFromVector:playerLocation toPoint:floorPosition];
        }
    }
    return vectorReturn;
}

-(void)logPositionInNode:(SCNNode *)node withDescription:(NSString *)description {
    NSLog(@"%@..........: %f, %f", description, node.position.x, node.position.z);
}

-(void)updateWithDeltaTime:(NSTimeInterval)seconds {
    //[self logPositionInNode:self.node withDescription:@"no moveComponent"];
}

@end
