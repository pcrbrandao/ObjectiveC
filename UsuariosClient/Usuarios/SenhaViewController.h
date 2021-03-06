//
//  SenhaViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 18/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioController.h"
#import "RootViewController.h"
// #import "Animacao.h"

@interface SenhaViewController : RootViewController

@property (weak, nonatomic) IBOutlet UILabel *labelMensagem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicadorDeAtividade;
@property (weak, nonatomic) IBOutlet UILabel *labelUsuario;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
- (IBAction)confirmaSenha:(id)sender;

//@property (retain, nonatomic) NSMutableArray *usuarios;

@end
