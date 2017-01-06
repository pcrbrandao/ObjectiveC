//
//  ShapeTypes.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 09/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ShapeTypes.h"

@implementation ShapeTypes

+(ShapeType)random {
    
    int maxValue = ShapeTypeTube;
    ShapeType rand = arc4random_uniform(UINT32_C(maxValue+1));
    return rand;
}

@end
