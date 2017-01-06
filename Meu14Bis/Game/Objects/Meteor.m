//
//  Meteor.m
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Meteor.h"
#import "OALSimpleAudio.h"
#import "GameScene.h"

@implementation Meteor

-(id)initComArquivo:(NSString *)arquivo {
    self = [super init];
    if (self) {
        self.arquivo = arquivo;
        self = [Meteor spriteWithImageNamed:arquivo];
        self.positionX = arc4random_uniform(SCREEN_WIDTH);
        self.positionY = SCREEN_HEIGHT;
        self.position = ccp(self.positionX, self.positionY);
    }
    
    return self;
}

-(void)update:(CCTime)delta {
    if (![[Runner sharedRunner] isGamePaused]) {
        self.positionY -= 1;
        self.position = ccp(self.positionX, self.positionY);
    }
}

-(void)explode:(GameScene *)sender {
    // som
    [[OALSimpleAudio sharedInstance] playEffect:@"bang.wav"];
    
    // efeitos
    float dt = 0.2;
    CCActionScaleBy *a1 = [CCActionScaleBy actionWithDuration:dt scale:0.5];
    CCActionFadeOut *a2 = [CCActionFadeOut actionWithDuration:dt];
    CCActionSpawn *s1 = [CCActionSpawn actionWithArray:[NSArray arrayWithObjects:a1,a2, nil]];
    
    // após o efeito
    CCActionCallFunc *c1 = [CCActionCallFunc actionWithTarget:self
                                                     selector:@selector(removeMe)];
    // executa o efeito
    [self runAction:[CCActionSequence actionWithArray:[NSArray arrayWithObjects:s1,c1, nil]]];
    
    // notifica delegate
    [self.delegate meteorWillBeRemoved:self];
    [[sender score] increase];
    
    if (sender.score.score >= 5) {
        [sender startFinalScreen];
    }
}

-(void)removeMe {
    [self removeFromParentAndCleanup:YES];
}

@end
