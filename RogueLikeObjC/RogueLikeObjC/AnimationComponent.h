//
//  AnimationComponent.h
//  RogueLikeObjC
//
//  Created by Pedro Brandão on 01/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SpriteKit/SpriteKit.h>

@interface AnimationComponent : GKComponent

@property (nonatomic,retain)SKNode *node;
@property (nonatomic,retain)NSMutableArray *idleFrames;
@property (nonatomic,retain)NSArray *playerIdleFrames;
@property (nonatomic,retain)SKTextureAtlas *idleAtlas;
@property (nonatomic,retain)NSString *atlasName;


-(id)initWithAtlasName:(NSString *)name;
-(void)playIdleMovement;

@end
