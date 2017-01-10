//
//  Runner.m
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "Runner.h"

@implementation Runner

static Runner *sharedRunner = nil;

+(Runner *)sharedRunner {
    if (!sharedRunner) {
        sharedRunner = [[Runner alloc] init];
    }
    return sharedRunner;
}

@end
