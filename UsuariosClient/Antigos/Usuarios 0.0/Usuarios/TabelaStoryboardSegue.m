//
//  TabelaStoryboardSegue.m
//  Usuarios
//
//  Created by Pedro Brandão on 05/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "TabelaStoryboardSegue.h"
#import "UsuariosViewController.h"
#import "SenhaViewController.h"

@implementation TabelaStoryboardSegue

-(void)executar:(UIStoryboardSegue *)segue sender:(id)sender viewController:(SenhaViewController *)view {
    
    UsuariosViewController *tabela = segue.destinationViewController;
    tabela.usuarios = view.usuarios;
}

@end
