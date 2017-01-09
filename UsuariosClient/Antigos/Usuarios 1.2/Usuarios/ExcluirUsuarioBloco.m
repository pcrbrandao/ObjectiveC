//
//  ExcluirUsuarioBloco.m
//  Usuarios
//
//  Created by Pedro Brandão on 21/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ExcluirUsuarioBloco.h"
#import "UsuarioTableViewController.h"

@implementation ExcluirUsuarioBloco

-(void)progresso:(NSProgress *)progresso comViewController:(UIViewController *)view comSender:(id)sender {
    NSLog(@"Progresso...");
}

-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(UsuarioTableViewController *)view comSender:(NSIndexPath *)sender {
    NSLog(@"Usuário excluído com sucesso!");
    
    int indexPathRow = sender.row;
    [view.usuarios removeObjectAtIndex:indexPathRow];
    [view.tableView deleteRowsAtIndexPaths:@[sender] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(UIViewController *)view comSender:(id)sender {
    NSLog(@"Erro tentando excluir: %@", erro.localizedDescription);
}

@end
