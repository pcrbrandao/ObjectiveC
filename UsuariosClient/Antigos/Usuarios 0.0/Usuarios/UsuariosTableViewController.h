//
//  UsuariosTableViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 04/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "UsuarioController.h"

@interface UsuariosTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewUsuarios;

@property (nonatomic, retain)NSMutableArray *usuarios;
@property (nonatomic, retain)Usuario *usuario;
@property (nonatomic, retain)UsuarioController *usuarioController;

@end
