//
//  UsuariosBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 05/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuariosBloco.h"
#import "UsuarioTableViewController.h"
#import "Animacao.h"

@implementation UsuariosBloco

-(void)progresso:(NSProgress *)progresso comViewController:(UsuarioTableViewController *)view comSender:(id)sender {
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(UsuarioTableViewController *)view comSender:(id)sender {
    
    // antes de prosseguir tenho que converter o response
    // que é um NSDictionary em um NSArray de usuarios
    NSArray *dados = [response objectForKey:@"usuario"];
    view.usuarios = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        view.usuario = [[Usuario alloc] init];
        
        [Controller setUsuario:view.usuario comDicionario:item];
        [view.usuarios addObject:view.usuario];
    }
    
    [view.tableView reloadData];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(UsuarioTableViewController *)view comSender:(id)sender {
    
}

@end
