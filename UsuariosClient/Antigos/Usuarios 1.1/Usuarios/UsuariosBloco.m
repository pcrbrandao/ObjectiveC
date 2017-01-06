//
//  UsuariosBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 05/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuariosBloco.h"
#import "SenhaViewController.h"
#import "Animacao.h"

@implementation UsuariosBloco

-(void)progresso:(NSProgress *)progresso comViewController:(SenhaViewController *)view comSender:(id)sender {
    [view.indicadorDeAtividade setHidden:NO];
    [view.indicadorDeAtividade startAnimating];
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(SenhaViewController *)view comSender:(id)sender {
    
    // antes de prosseguir tenho que converter o response
    // que é um NSDictionary em um NSArray de usuarios
    NSArray *dados = [response objectForKey:@"usuario"];
    view.usuarios = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        view.usuario = [[Usuario alloc] init];
        
        [Controller setUsuario:view.usuario comDicionario:item];
        [view.usuarios addObject:view.usuario];
    }
    [view.indicadorDeAtividade stopAnimating];
    [view.indicadorDeAtividade setHidden:YES];
    [view performSegueWithIdentifier:@"segueTabela" sender:sender];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(SenhaViewController *)view comSender:(id)sender {
    
    [view.indicadorDeAtividade stopAnimating];
    [view.indicadorDeAtividade setHidden:YES];
    
    [view.labelMensagem setText:@"Erro obtendo lista"];
    [Animacao transformaUILabel:view.labelMensagem];
}

@end
