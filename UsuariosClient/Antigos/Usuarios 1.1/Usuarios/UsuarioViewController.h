//
//  UsuarioViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 18/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "AFNetManager.h"
#import "UsuarioController.h"

@interface UsuarioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsuario;
@property (weak, nonatomic) IBOutlet UILabel *labelUsuarioMensagem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *emAndamento;
- (IBAction)usuarioExistente:(id)sender;
- (IBAction)enterUsuario:(id)sender;
- (IBAction)usuarioNovo:(id)sender;
- (IBAction)irParaConfigurar:(id)sender;

@property (retain, nonatomic) UsuarioController *usuarioController;
@property (retain, nonatomic) Usuario *usuario;

@end

