//
//  ParticleComponent.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 19/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ParticleComponent.h"

@implementation ParticleComponent

-(id)initWithColor:(UIColor *)color andGeometry:(SCNGeometry *)geometry {
    
    self = [super init];
    if (self) {
        _particle = [SCNParticleSystem particleSystemNamed:@"Trail.scnp" inDirectory:nil];
        [_particle setParticleColor:color];
        [_particle setEmitterShape:geometry];
    }
    return self;
}

@end
