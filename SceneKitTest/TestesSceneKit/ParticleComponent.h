//
//  ParticleComponent.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 19/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import <SceneKit/SceneKit.h>

@interface ParticleComponent : GKComponent

@property (nonatomic,retain)SCNParticleSystem *particle;

-(id)initWithColor:(UIColor *)color andGeometry:(SCNGeometry *)geometria;

@end
