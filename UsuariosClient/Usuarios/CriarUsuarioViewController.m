//
//  CriarUsuarioViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 27/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "CriarUsuarioViewController.h"
#import "CriarUsuarioBloco.h"
#import "CriarUsuarioController.h"

@interface CriarUsuarioViewController ()

@end

@implementation CriarUsuarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_labelMensagem setHidden:YES];
    [_indicadorDeAtividade setHidden:YES];
    
    [_textFieldNome setPlaceholder:self.usuario.nome];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)novoUsuario:(id)sender {
    // Validar usuário e senha
    
    if ([self validarNome:_textFieldNome eSenha:_textFieldSenha]) {
        CriarUsuarioBloco *bloco = [[CriarUsuarioBloco alloc] init];
        CriarUsuarioController *criarController = [[CriarUsuarioController alloc] init];
        [self.controller controller:criarController comUsuario:self.usuario comBloco:bloco comSender:sender naView:self];
    }
}
@end
