//
//  MeteorsEngine.m
//  14Bis
//
//  Created by Pedro Brandão on 16/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "MeteorsEngine.h"


@implementation MeteorsEngine

-(id)init {
    self = [super init];
    if (self) {
        [self schedule:@selector(meteorsEngine:) interval:(1.0/10.0)];
    }
    return self;
}

+(MeteorsEngine *)meteorEngine {
    return [[MeteorsEngine alloc] init];
}

-(void)meteorsEngine:(float)dt {
    // sorte: 1 em 30 gera um novo meteoro
    if (![[Runner sharedRunner] isGamePaused]) {
        if (arc4random_uniform(30)==0) {
            if ([self.delegate respondsToSelector:@selector(meteorsEngineDidCreateMeteor:)]) {
                // ainda não
                [self.delegate meteorsEngineDidCreateMeteor:[[Meteor alloc] initComArquivo:kMETEOR]];
            }
        }
    }
}

@end
