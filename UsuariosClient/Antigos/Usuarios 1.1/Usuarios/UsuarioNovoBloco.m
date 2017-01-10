//
//  UsuarioNovoBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 03/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioNovoBloco.h"
#import "UsuarioViewController.h"
#import "Animacao.h"

@implementation UsuarioNovoBloco

-(void)progresso:(NSProgress *)progresso comViewController:(UsuarioViewController *)view comSender:(id)sender {
    
    [view.emAndamento setHidden:NO];
    [view.emAndamento startAnimating];
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(UsuarioViewController *)view comSender:(id)sender {
    
    [view.emAndamento stopAnimating];
    [view.emAndamento setHidden:YES];
    [view.labelUsuarioMensagem setText:@"usuário já existe"];
    [Animacao tremeUIControl:view.textFieldUsuario];
    [Animacao transformaUILabel:view.labelUsuarioMensagem];

}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(UsuarioViewController *)view comSender:(id)sender {
    
    [view.emAndamento stopAnimating];
    [view.emAndamento setHidden:YES];
    if (view.textFieldUsuario.text.length) {
        [view performSegueWithIdentifier:@"segueCriar" sender:sender];
    } else {
        [view.labelUsuarioMensagem setText:@"Digite um nome"];
        [Animacao tremeUIControl:view.textFieldUsuario];
        [Animacao transformaUILabel:view.labelUsuarioMensagem];
    }

}

@end
