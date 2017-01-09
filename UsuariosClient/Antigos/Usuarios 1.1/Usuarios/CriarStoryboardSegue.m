//
//  CriarStoryboardSegue.m
//  Usuarios
//
//  Created by Pedro Brandão on 03/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "CriarStoryboardSegue.h"
#import "CriarUsuarioViewController.h"
#import "UsuarioViewController.h"

@implementation CriarStoryboardSegue

-(void)executar:(UIStoryboardSegue *)segue sender:(id)sender viewController:(UsuarioViewController *)view {

    CriarUsuarioViewController *criar = segue.destinationViewController;
    NSString *nome = [view.textFieldUsuario text];
    
    criar.usuario = [[Usuario alloc] initComNome:nome senha:nil];
}

@end
