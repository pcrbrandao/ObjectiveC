//
//  UsuariosViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 13/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "UsuarioController.h"

@class DetalheViewController;

@interface UsuariosViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (weak, nonatomic) IBOutlet UITableView *tableViewUsuarios;
- (IBAction)irParaInicio:(id)sender;

@property (nonatomic, retain)NSMutableArray *usuarios;
@property (nonatomic, retain)Usuario *usuario;
@property (nonatomic, retain)UsuarioController *usuarioController;
@property (nonatomic, retain)DetalheViewController *detalheViewController;

@end
