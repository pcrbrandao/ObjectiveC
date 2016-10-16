//
//  GeometryComponent.m
//  SceneKitObjC-Shooter
//
//  Created by Pedro Brandão on 06/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GeometryComponent.h"

@implementation GeometryComponent

-(instancetype)initWithName:(NSString *)name InScene:(SCNScene *)scene {
    self = [super init];
    if (self) {
        _node = [scene.rootNode childNodeWithName:name recursively:false];
        if (!_node) {
            NSLog(@"Esse nome, %@, não está na scene: %@", name, scene);
        }
    }
    
    return self;
}

@end
