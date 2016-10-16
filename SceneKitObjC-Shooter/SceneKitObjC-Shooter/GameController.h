//
//  GameController.h
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import "MainScene.h"

@interface GameController : NSObject

@property (nonatomic,retain)MainScene *scene;

-(void)handlePanGesture:(UIPanGestureRecognizer *)pan;

+(GameController *)sharedController;

@end
