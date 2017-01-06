//
//  RootViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 24/06/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_usuario) {
        _usuario = [[Usuario alloc] initComNome:@"" senha:@""];
    }
    _controller = [[UsuarioController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validarNome:(UITextField *)nome eSenha:(UITextField *)senha {
    if (nome.text.length && senha.text.length) {
        [self.usuario setNome:nome.text];
        [self.usuario setSenha:senha.text];
        return YES;
    } else {
        return NO;
    }
}

@end
