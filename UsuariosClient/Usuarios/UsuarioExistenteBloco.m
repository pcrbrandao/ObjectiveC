//
//  UsuarioExistenteBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 01/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioExistenteBloco.h"
#import "UsuarioViewController.h"
#import "Animacao.h"

@implementation UsuarioExistenteBloco

// implementando o bloco em caso de sucesso
-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(UsuarioViewController *)view comSender:(id)sender {
    [view.emAndamento stopAnimating];
    [view.emAndamento setHidden:YES];
    [Controller setUsuario:view.usuario comDicionario:response];
    if (view.usuario.nome.length) {
        [view performSegueWithIdentifier:@"segueSenha" sender:sender];
    } else {
        NSLog(@"Usuário não encontrado");
    }
}

// Acrescentando o andamento
 -(void)progresso:(NSProgress *)progresso comViewController:(UsuarioViewController *)view comSender:(id)sender {
     
     [view.emAndamento setHidden:NO];
     [view.emAndamento startAnimating];
 }

// em caso de erro
-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(UsuarioViewController *)view comSender:(id)sender {
    
    [view.emAndamento stopAnimating];
    [view.emAndamento setHidden:YES];
    [Animacao tremeUIControl:view.textFieldUsuario];
    [Animacao transformaUILabel:view.labelUsuarioMensagem];
    NSLog(@"%@%@", @"Erro em procurando por nome: ", erro.localizedDescription);
}
@end
