//
//  UsuarioViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 18/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioViewController.h"
#import "AFNetworking.h"
#import "SenhaViewController.h"
#import "CriarUsuarioViewController.h"
#import "UsuarioExistenteBloco.h"
#import "UsuarioNovoBloco.h"
#import "SegueView.h"

@interface UsuarioViewController ()

@end

@implementation UsuarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelUsuarioMensagem.hidden = YES;
    _emAndamento.hidden = YES;
    
    _usuarioController = [[UsuarioController alloc] init];
    _usuario = [[Usuario alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)usuarioExistente:(id)sender {
    [_emAndamento setHidden:NO];
    [_emAndamento startAnimating];
    [_usuarioController setUsuarioComNome:_textFieldUsuario.text
                            sender:sender
                comBlocoNetManager:[[UsuarioExistenteBloco alloc] init]
                           naView:self];
}

- (IBAction)enterUsuario:(id)sender {
    [self usuarioExistente:sender];
}


- (IBAction)usuarioNovo:(id)sender {
    
    [_usuarioController setUsuarioComNome:_textFieldUsuario.text
                            sender:sender
                comBlocoNetManager:[[UsuarioNovoBloco alloc] init]
                           naView:self];
}

- (IBAction)irParaConfigurar:(id)sender {
    [self performSegueWithIdentifier:@"segueConfigurar" sender:sender];
}

// Sobrescevendo para outra viewController
-(void)prepareForSegue:(UIStoryboardSegue<SegueViewProtocol> *)segue sender:(id)sender {
    
    [segue executar:segue sender:sender viewController:self];
}

-(IBAction)reiniciarNavegacao:(UIStoryboardSegue *)segue {
    
}

@end
