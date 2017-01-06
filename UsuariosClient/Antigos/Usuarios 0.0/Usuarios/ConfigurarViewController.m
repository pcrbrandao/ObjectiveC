//
//  ConfigurarViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 15/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ConfigurarViewController.h"
#import "Animacao.h"

@interface ConfigurarViewController ()

@end

@implementation ConfigurarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_labelMensagem setHidden:YES];
    _usuarioController = [[UsuarioController alloc] init];
    [_textFieldEndereco setPlaceholder:_usuarioController.controller.urlServico];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atualizarEndereco:(id)sender {
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setURL:[NSURL URLWithString:_textFieldEndereco.text] forKey:@"servico"];
    
    [_textFieldEndereco setPlaceholder:_textFieldEndereco.text];
    [_textFieldEndereco setText:@""];
    [_labelMensagem setText:@"Atualizado!"];
    
    [Animacao transformaUILabel:_labelMensagem];
    NSLog(@"url atualizado: %@", [def URLForKey:@"servico"]);
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
@end
