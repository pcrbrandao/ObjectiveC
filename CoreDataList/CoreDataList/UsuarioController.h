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

@end

/**
 * @brief Aqui estão as propriedades privadas
 */
@interface UsuarioController()

/**
 * @brief Provisioramente os dados serão armazenados nesse array.
 */
@property (nonatomic,retain) NSMutableArray<Usuario *> *usuarios;

@end
