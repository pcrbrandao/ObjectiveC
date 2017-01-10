//
//  criarUsuarioBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 12/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "CriarUsuarioBloco.h"
#import "CriarUsuarioViewController.h"
#import "Animacao.h"

@implementation CriarUsuarioBloco

-(void)progresso:(NSProgress *)progresso comViewController:(CriarUsuarioViewController *)view comSender:(id)sender {
    
    [view.indicadorDeAtividade setHidden:NO];
    [view.indicadorDeAtividade startAnimating];
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(CriarUsuarioViewController *)view comSender:(id)sender {
    
    [view.indicadorDeAtividade setHidden:YES];
    [view.indicadorDeAtividade stopAnimating];
    [view.labelMensagem setText:@"Usuário criado!"];
    [Animacao transformaUILabel:view.labelMensagem];
    [view.textFieldNome setText:@""];
    [view.textFieldSenha setText:@""];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(CriarUsuarioViewController *)view comSender:(id)sender {
    [view.indicadorDeAtividade stopAnimating];
    [view.indicadorDeAtividade setHidden:YES];
    [view.labelMensagem setText:@"Erro tentando criar usuário"];
    [Animacao transformaUILabel:view.labelMensagem];
    NSLog(@"Ocorreu um erro: @%@", erro.localizedDescription);
}

@end
