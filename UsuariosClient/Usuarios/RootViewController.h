//
//  RootViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 24/06/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "UsuarioController.h"

@interface RootViewController : UIViewController

@property (nonatomic, retain)Usuario *usuario;
@property (nonatomic, retain)UsuarioController *controller;

-(BOOL)validarNome:(UITextField *)nome eSenha:(UITextField *)senha;

@end
