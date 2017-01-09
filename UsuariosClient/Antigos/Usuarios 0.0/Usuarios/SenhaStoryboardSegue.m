//
//  SenhaStoryboardSegue.m
//  Usuarios
//
//  Created by Pedro Brandão on 03/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "SenhaStoryboardSegue.h"
#import "SenhaViewController.h"
#import "UsuarioViewController.h"

@implementation SenhaStoryboardSegue

-(void)executar:(UIStoryboardSegue *)segue sender:(id)sender viewController:(UsuarioViewController *)view {
    
    SenhaViewController *senhaViewController =
    segue.destinationViewController;
    
    [senhaViewController setUsuario:view.usuario];
}

@end
