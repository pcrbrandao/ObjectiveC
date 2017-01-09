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
    if (!_usuario) {
        _usuario = [[Usuario alloc] initComNome:@"" senha:@""];
    }
    [_textFieldNome setPlaceholder:_usuario.nome];
    _controller = [[UsuarioController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)novoUsuario:(id)sender {
    // Validar usuário e senha
    if (_textFieldNome.text.length && _textFieldSenha.text.length) {
        [_usuario setNome:_textFieldNome.text];
        [_usuario setSenha:_textFieldSenha.text];
        CriarUsuarioBloco *bloco = [[CriarUsuarioBloco alloc] init];
        
        CriarUsuarioController *criarController = [[CriarUsuarioController alloc] init];
        [_controller controller:criarController comUsuario:_usuario comBloco:bloco comSender:sender naView:self];
        
        //[_controller criarUsuario:_usuario comBloco:bloco naView:self eSender:sender];
    }
}
@end
