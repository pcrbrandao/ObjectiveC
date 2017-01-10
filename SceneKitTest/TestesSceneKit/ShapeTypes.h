//
//  ShapeTypes.h
//  Testes SceneKit
//
//  Created by Pedro Brandão on 09/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, ShapeType) {
    ShapeTypeBox = 0,
    ShapeTypeSphere,
    ShapeTypePyramid,
    ShapeTypeTorus,
    ShapeTypeCapsule,
    ShapeTypeCylinder,
    ShapeTypeCone,
    ShapeTypeTube
};


@interface ShapeTypes : NSObject

+(ShapeType)random;

@end
