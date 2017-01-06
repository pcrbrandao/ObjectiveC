//
//  UsuarioTableViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 26/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioController.h"
#import "DetalheViewController.h"

@interface UsuarioTableViewController : UITableViewController

@property (nonatomic, retain)NSMutableArray *usuarios;
@property (nonatomic, retain)Usuario *usuario;
@property (nonatomic, retain)UsuarioController *usuarioController;
@property (nonatomic, retain)DetalheViewController *detalheViewController;

@end
