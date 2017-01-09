//
//  SenhaViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 18/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "SenhaViewController.h"
#import "AutenticarBloco.h"
#import "AutenticarUsuarioController.h"
#import "Animacao.h"
#import "SegueView.h"

@interface SenhaViewController ()

@end

@implementation SenhaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _usuarioController = [[UsuarioController alloc] init];
    [_labelUsuario setHidden:YES];
    [_labelMensagem setHidden:YES];
    [_indicadorDeAtividade setHidden:YES];
    [_labelUsuario setText:[NSString stringWithFormat:@"%@",
                            [_usuario nome]]];
    [Animacao apareceEsomeUILabel:_labelUsuario];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmaSenha:(id)sender {
    
    if (_textFieldSenha.text.length) {
        
        _usuario = [[Usuario alloc] initComNome:_labelUsuario.text
                                          senha:_textFieldSenha.text];
        
        [_usuarioController controller:[[AutenticarUsuarioController alloc] init]
                            comUsuario:_usuario
                              comBloco:[[AutenticarBloco alloc] init]
                             comSender:sender
                                naView:self];
        
        //[_usuarioController autenticarUsuario:_usuario sender:sender comBlocoNetManager:[[AutenticarBloco alloc] init] naView:self];
    }
}

// Sobrescevendo para outra viewController
-(void)prepareForSegue:(UIStoryboardSegue<SegueViewProtocol> *)segue sender:(id)sender {
    
    [segue executar:segue sender:sender viewController:self];
}

@end
