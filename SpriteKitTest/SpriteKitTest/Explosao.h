//
//  Explosao.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 01/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Explosao : SKSpriteNode

@property (nonatomic,retain) SKAction *sequence;

-(id)initWithPoint:(CGPoint)point;

@end
