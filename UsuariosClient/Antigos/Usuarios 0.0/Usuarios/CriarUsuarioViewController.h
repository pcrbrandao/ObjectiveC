//
//  CriarUsuarioViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 27/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "UsuarioController.h"

@interface CriarUsuarioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UILabel *labelMensagem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicadorDeAtividade;
- (IBAction)novoUsuario:(id)sender;

@property (nonatomic, retain)Usuario *usuario;
@property (nonatomic, retain)NSString *urlServices;
@property (nonatomic, retain)UsuarioController *controller;

@end
