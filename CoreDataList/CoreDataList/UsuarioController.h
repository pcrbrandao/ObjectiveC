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
<<<<<<< HEAD
=======

>>>>>>> 29b2eca9e61cbae0af14f3473fa8dceb14329c64
/**
 * @brief Requer um usuário válido e retorna nil se tudo correr bem.
 */
-(NSError *)addUsuario:(Usuario *)usuario;
<<<<<<< HEAD
-(NSInteger)usuariosCount;
-(NSError *)removeUsuarioComID:(NSInteger)ID;
-(Usuario *)usuarioComID:(NSInteger)ID;

+(UsuarioController *)sharedInstance;
@end


=======

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
>>>>>>> 29b2eca9e61cbae0af14f3473fa8dceb14329c64
