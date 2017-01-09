//
//  AtualizarBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 08/07/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AtualizarBloco.h"
#import "AtualizarViewController.h"
#import "Animacao.h"

@implementation AtualizarBloco

-(void)progresso:(NSProgress *)progresso comViewController:(AtualizarViewController *)view comSender:(id)sender {
    
    [view.atividade setHidden:NO];
    [view.atividade startAnimating];
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(AtualizarViewController *)view comSender:(id)sender {
    
    [view.atividade setHidden:YES];
    [view.atividade stopAnimating];
    [view.mensagem setText:@"Usuário atualizado!"];
    [Animacao transformaUILabel:view.mensagem];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(AtualizarViewController *)view comSender:(id)sender {
    
    [view.atividade stopAnimating];
    [view.atividade setHidden:YES];
    [view.mensagem setText:@"Erro tentando atualizar usuário"];
    [Animacao transformaUILabel:view.mensagem];
    NSLog(@"Ocorreu um erro: @%@", erro.localizedDescription);
}

@end
