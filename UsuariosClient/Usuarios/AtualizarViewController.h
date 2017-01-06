//
//  AtualizarViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 07/06/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AtualizarViewController : RootViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *atividade;
@property (weak, nonatomic) IBOutlet UILabel *mensagem;

- (IBAction)salvarEdicao:(id)sender;

@end
