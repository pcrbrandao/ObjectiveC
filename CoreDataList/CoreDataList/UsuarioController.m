//
//  UsuarioController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 07/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UsuarioController.h"

/**
 * @brief A variável estática é para o controle da instância.
 */
static UsuarioController *sharedInstance = nil;

@implementation UsuarioController

/**
 * @brief Retorna o singleton (instância única)
 */
+(UsuarioController *)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[UsuarioController alloc] init];
        sharedInstance.usuarios = [[NSMutableArray alloc] init];
    }
    return sharedInstance;
}

/**
 * @brief Retorna um erro caso o usuário não seja válido ou nil se estiver ok
 */
-(NSError *)addUsuario:(Usuario *)usuario {
    
    // O detalhe do erro
    NSDictionary *details = @{NSLocalizedDescriptionKey:@"Usuário inválido"};
    NSError *err = [NSError errorWithDomain:@"UsuarioController" code:-1 userInfo:details];
    
    if (!usuario) {
        return err;
    }
    
    [self.usuarios addObject:usuario];
    NSLog(@"\nUsuário acrescentado com sucesso! %@", [usuario nome]);
    NSLog(@"\nUsuarios na lista: %d", [self.usuarios count]);
    
    return nil;
}

@end
