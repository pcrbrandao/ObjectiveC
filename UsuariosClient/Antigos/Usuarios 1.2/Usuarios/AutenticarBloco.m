//
//  AutenticarBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 06/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AutenticarBloco.h"
#import "SenhaViewController.h"
#import "UsuariosBloco.h"
#import "Animacao.h"

@implementation AutenticarBloco

-(void)progresso:(NSProgress *)progresso comViewController:(SenhaViewController *)view comSender:(id)sender {
    
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(SenhaViewController *)view comSender:(id)sender {
    
    [view.usuarioController setUsuariosComBloco:[[UsuariosBloco alloc] init] sender:sender naView:view];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(SenhaViewController *)view comSender:(id)sender {
    
    NSLog(@"%@", erro.localizedDescription);
    
    [view.labelMensagem setText:@"Senha não confere"];
    [Animacao tremeUIControl:view.textFieldSenha];
    [Animacao transformaUILabel:view.labelMensagem];
}

@end
