//
//  UsuarioController.m
//  Usuarios
//
//  Created by Pedro Brandão on 19/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioController.h"
#import "CriarUsuarioController.h"

@implementation UsuarioController

-(id)init {
    
    if ((self = [super init])) {
        _controller = [[Controller alloc] init];
    }
    return self;
}

#pragma mark - CRUD
// Obtém a lista do servidor e atribui a usuarios na view
-(void)setUsuariosComBloco:(BlocoNetManager *)bloco sender:(id)sender naView:(UIViewController *)view {
    
    NSString *local = [NSString stringWithFormat:@"%@%@", _controller.urlServico,@"/listarusuarios"];
    [_controller getNolocal:local comParam:nil comView:view comBloco:bloco eSender:sender];
}

// Atribui o nome a um usuário caso esse exista no db.
// utiliza o serviço encontranome que retorna um objeto com o nome
// solicitado caso exista e retorna erro caso não exista.
-(void)setUsuarioComNome:(NSString *)nome sender:(id)sender comBlocoNetManager:(BlocoNetManager *)bloco naView:(UIViewController *)view {
    
    NSString *local = [NSString stringWithFormat:@"%@%@", _controller.urlServico,@"/encontranome"];
    Usuario *usuario = [[Usuario alloc] initComNome:nome senha:nil];
    
    NSDictionary *param = usuario.toDictionary;
    [_controller postNoLocal:local comParam:param comView:view comBloco:bloco eSender:sender];
}

-(void)controller:(Controller *)comando comUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view {
    
    [comando comandoComUsuario:usuario
                      comBloco:bloco
                     comSender:sender
                        naView:view];
}

@end
