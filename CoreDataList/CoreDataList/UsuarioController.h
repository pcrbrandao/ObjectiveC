//
//  UsuarioController.h
//  CoreDataList
//
//  Created by Pedro Brandão on 07/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

/**
 * @brief Fornece métodos para acesso os dados de usuários. É um singleton.
 */
@interface UsuarioController : NSObject
/**
 * @brief Requer um usuário válido e retorna nil se tudo correr bem.
 */
-(NSError *)addUsuario:(Usuario *)usuario;
-(NSInteger)usuariosCount;
-(NSError *)removeUsuarioID:(NSInteger)ID;
-(Usuario *)usuarioID:(NSInteger)ID;
-(Usuario *)usuarioNome:(NSString *)nome;

+(UsuarioController *)sharedInstance;
@end


