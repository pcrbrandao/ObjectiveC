//
//  ExcluirUsuarioController.m
//  Usuarios
//
//  Created by Pedro Brandão on 22/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ExcluirUsuarioController.h"

@implementation ExcluirUsuarioController

-(void)comandoComUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view {
    
    NSString *local = [NSString stringWithFormat:@"%@%@", self.urlServico,@"/delete"];
    NSDictionary *param = @{@"ID" : [NSNumber numberWithLong:usuario.iD]};
    
    [self deleteNoLocal:local comParam:param comView:view comBloco:bloco eSender:sender];
}

@end
