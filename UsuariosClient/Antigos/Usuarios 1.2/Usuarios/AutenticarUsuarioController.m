//
//  AutenticarUsuarioController.m
//  Usuarios
//
//  Created by Pedro Brandão on 21/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AutenticarUsuarioController.h"

@implementation AutenticarUsuarioController

-(void)comandoComUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view {
    
    NSString *local = [NSString stringWithFormat:@"%@%@", self.urlServico,@"/autenticar"];
    // NSDictionary *param = @{@"usuario": usuario.toJSONString};
    NSDictionary *param = usuario.toDictionary;
    
    [self postNoLocal:local comParam:param comView:view comBloco:bloco eSender:sender];
    //[self getNolocal:local comParam:param comView:view comBloco:bloco eSender:sender];
}

@end
