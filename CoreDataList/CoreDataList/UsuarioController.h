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

@property (nonatomic, retain)NSPersistentContainer *persistentContainer;

-(NSError *)addUsuario:(Usuario *)usuario;
-(NSError *)removeUsuarioID:(NSInteger)ID;
-(NSError *)updateUsuario:(Usuario *)usuario;
-(NSError *)addUsuarioComNome:(NSString *)nome eSenha:(NSString *)senha;

-(Usuario *)usuarioID:(NSInteger)ID;
-(Usuario *)usuarioNome:(NSString *)nome;
-(NSMutableArray<Usuario *> *)usuarioList;
-(NSInteger)usuariosCount;

+(UsuarioController *)sharedInstance;
@end


