//
//  AtualizarController.m
//  Usuarios
//
//  Created by Pedro Brandão on 08/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AtualizarController.h"

@implementation AtualizarController

-(void)comandoComUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view {
    
    [usuario setDataAtualizacao:nil];
    NSLog(@"Usuário em AtualizarCOntroller.m %@", usuario);
    
    NSString *local = [NSString stringWithFormat:@"%@%@", self.urlServico, @"/update"];
    NSDictionary *param = usuario.toDictionary;
    
    //[self putNolocal:local comParam:param comView:view comBloco:bloco eSender:sender];
    [self postNoLocal:local comParam:param comView:view comBloco:bloco eSender:sender];
}

@end
