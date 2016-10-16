//
//  AnimationComponent.m
//  RogueLikeObjC
//
//  Created by Pedro Brandão on 01/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AnimationComponent.h"

@implementation AnimationComponent

-(id)initWithAtlasName:(NSString *)name {
    self = [super init];
    if (self) {
        _atlasName = name;
    }
    return self;
}

-(NSArray *)playerIdleFrames {
    if (!_playerIdleFrames) {
        _playerIdleFrames = self.idleFrames;
    }
    return _playerIdleFrames;
}

-(SKTextureAtlas *)idleAtlas {
    if (!_idleAtlas) {
        _idleAtlas = [SKTextureAtlas atlasNamed:self.atlasName];
    }
    return _idleAtlas;
}

-(NSMutableArray *)idleFrames {
    if (!_idleFrames) {
        _idleFrames = [NSMutableArray array];
        
        int numImages = self.idleAtlas.textureNames.count;
       
        for (int i=0; i< numImages; i++) {
            NSString *textureName = [NSString stringWithFormat:@"%@%d",self.atlasName, i];
            SKTexture *temp = [self.idleAtlas textureNamed:textureName];
            [_idleFrames addObject:temp];
        }
    }
    return _idleFrames;
}

-(SKNode *)node {
    if (!_node) {
        
        _node = [SKSpriteNode spriteNodeWithTexture:self.playerIdleFrames[0]];
    }
    return _node;
}


-(void)playIdleMovement {
    
    SKAction *animate = [SKAction animateWithTextures:self.playerIdleFrames timePerFrame:0.5f];
    SKAction *repeatAnimate = [SKAction repeatActionForever:animate];
    [self.node runAction:repeatAnimate];
    
}

@end
