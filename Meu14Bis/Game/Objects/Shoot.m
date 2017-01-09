//
//  Shoot.m
//  14Bis
//
//  Created by Pedro Brandão on 18/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Shoot.h"
#import "OALSimpleAudio.h"

@implementation Shoot

-(id)initWithPositionX:(float)x andPositionY:(float)y {
    self = [super initWithImageNamed:kSHOOT];
    if (self) {
        _positionX = x;
        _positionY = y;
        _position = ccp(x,y);
    }
    [[OALSimpleAudio sharedInstance] playEffect:@"shoot.wav"];
    return self;
}

-(void)update:(CCTime)delta {
    if (![[Runner sharedRunner] isGamePaused]) {
        self.positionY += 2;
        self.position = ccp(self.positionX,self.positionY);
    }
}

-(void)explode:(id)sender {
    // efeitos
    float dt = 0.2;
    CCActionScaleBy *a1 = [CCActionScaleBy actionWithDuration:dt scale:2];
    CCActionFadeOut *a2 = [CCActionFadeOut actionWithDuration:dt];
    CCActionSpawn *s1 = [CCActionSpawn actionWithArray:[NSArray arrayWithObjects:a1,a2, nil]];
    
    // após o efeito
    CCActionCallFunc *c1 = [CCActionCallFunc actionWithTarget:self selector:@selector(removeMe)];
    
    // executa o efeito
    [self runAction:[CCActionSequence actionWithArray:[NSArray arrayWithObjects:s1,c1, nil]]];
    
    // Notifica delegate
    if ([self.delegate respondsToSelector:@selector(shootWillBeRemoved:)]) {
        [self.delegate shootWillBeRemoved:self];
    }
}

-(void)removeMe {
    [self removeFromParentAndCleanup:YES];
}

@end
