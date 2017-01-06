//
//  GameLabel.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 04/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteKitTest-Swift.h"

@interface GameLabel : SKLabelNode

-(id)initWithTexto:(NSString *)texto alinhadoA:(SKLabelHorizontalAlignmentMode)alinhamento;

@end
