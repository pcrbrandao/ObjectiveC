//
//  Background.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Background : SKSpriteNode

@property (nonatomic,assign) NSTimeInterval lastUpdateTime;
@property (nonatomic,assign) NSTimeInterval deltaFrameTime;
@property (nonatomic,assign) CGFloat amountToMovePerSecond;
@property (nonatomic,assign) CGFloat amountToMoveBackground;

-(id)initWithScene:(SKScene *)scene andImageNamed:(NSString *)image;
-(id)initWithScene:(SKScene *)scene;

-(void)animateInScene:(SKScene *)scene WithTime:(NSTimeInterval)time;
-(void)addBackgroundsInScene:(SKScene *)scene;

@end
