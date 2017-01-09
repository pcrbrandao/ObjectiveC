//
//  GameLabel.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 04/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "GameLabel.h"

@implementation GameLabel

-(id)initWithTexto:(NSString *)texto alinhadoA:(SKLabelHorizontalAlignmentMode)alinhamento {
    self = [super initWithFontNamed:@"The Bold Font"];
    
    Teste *teste = [[Teste alloc] initWithNome:texto];
    
    if (self) {
        [self setText:teste.nome];
        [self setHorizontalAlignmentMode:alinhamento];
        [self setFontSize:70];
        [self setFontColor:[SKColor whiteColor]];
        [self setZPosition:100];
    }
    return self;
}

@end
