//
//  AtualizarViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 07/06/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AtualizarViewController.h"
#import "AtualizarBloco.h"
#import "AtualizarController.h"

@interface AtualizarViewController ()

@end

@implementation AtualizarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mensagem setHidden:YES];
    [self.atividade setHidden:YES];
    [self.textFieldNome setText:self.usuario.nome];
    [self.textFieldSenha setText:self.usuario.senha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)salvarEdicao:(id)sender {
    
    if ([self validarNome:_textFieldNome eSenha:_textFieldSenha]) {
        
        AtualizarBloco *bloco = [[AtualizarBloco alloc] init];
        AtualizarController *atualizarController = [[AtualizarController alloc] init];
        
        [self.controller controller:atualizarController comUsuario:self.usuario comBloco:bloco comSender:sender naView:self];
    }
}


@end
