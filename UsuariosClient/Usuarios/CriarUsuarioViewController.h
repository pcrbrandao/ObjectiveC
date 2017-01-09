//
//  CriarUsuarioViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 27/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface CriarUsuarioViewController : RootViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UILabel *labelMensagem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicadorDeAtividade;
- (IBAction)novoUsuario:(id)sender;

@property (nonatomic, retain)NSString *urlServices;

@end
